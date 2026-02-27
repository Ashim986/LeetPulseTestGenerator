#include "CrashGuard.h"
#include <signal.h>
#include <setjmp.h>
#include <pthread.h>

static _Thread_local sigjmp_buf jumpBuffer;
static _Thread_local volatile sig_atomic_t guardActive = 0;

// Mutex-protected reference count for handler installation
static pthread_mutex_t guardMutex = PTHREAD_MUTEX_INITIALIZER;
static int guardRefCount = 0;
static struct sigaction origTrap, origAbrt, origIll, origBus, origFpe;

static void crashHandler(int sig) {
    if (guardActive) {
        guardActive = 0;
        siglongjmp(jumpBuffer, 1);
    }
    // Not inside a guard — forward to original handler
    struct sigaction *orig = NULL;
    switch (sig) {
        case SIGTRAP: orig = &origTrap; break;
        case SIGABRT: orig = &origAbrt; break;
        case SIGILL:  orig = &origIll;  break;
        case SIGBUS:  orig = &origBus;  break;
        case SIGFPE:  orig = &origFpe;  break;
    }
    if (orig && orig->sa_handler != SIG_DFL && orig->sa_handler != SIG_IGN) {
        orig->sa_handler(sig);
    } else {
        signal(sig, SIG_DFL);
        raise(sig);
    }
}

static void installHandlers(void) {
    pthread_mutex_lock(&guardMutex);
    if (guardRefCount == 0) {
        struct sigaction sa;
        sa.sa_handler = crashHandler;
        sa.sa_flags = SA_NODEFER;  // don't block the signal during handler
        sigemptyset(&sa.sa_mask);

        sigaction(SIGTRAP, &sa, &origTrap);
        sigaction(SIGABRT, &sa, &origAbrt);
        sigaction(SIGILL,  &sa, &origIll);
        sigaction(SIGBUS,  &sa, &origBus);
        sigaction(SIGFPE,  &sa, &origFpe);
    }
    guardRefCount++;
    pthread_mutex_unlock(&guardMutex);
}

static void uninstallHandlers(void) {
    pthread_mutex_lock(&guardMutex);
    guardRefCount--;
    if (guardRefCount == 0) {
        sigaction(SIGTRAP, &origTrap, NULL);
        sigaction(SIGABRT, &origAbrt, NULL);
        sigaction(SIGILL,  &origIll,  NULL);
        sigaction(SIGBUS,  &origBus,  NULL);
        sigaction(SIGFPE,  &origFpe,  NULL);
    }
    pthread_mutex_unlock(&guardMutex);
}

int runWithCrashGuard(void (^block)(void)) {
    installHandlers();

    int crashed = 0;
    if (sigsetjmp(jumpBuffer, 1) == 0) {
        guardActive = 1;
        block();
        guardActive = 0;
    } else {
        crashed = 1;
        // Re-install handlers — some systems reset after signal delivery
        // and abort() may have changed them
        {
            struct sigaction sa;
            sa.sa_handler = crashHandler;
            sa.sa_flags = SA_NODEFER;
            sigemptyset(&sa.sa_mask);
            sigaction(SIGTRAP, &sa, NULL);
            sigaction(SIGABRT, &sa, NULL);
            sigaction(SIGILL,  &sa, NULL);
            sigaction(SIGBUS,  &sa, NULL);
            sigaction(SIGFPE,  &sa, NULL);
        }
    }

    uninstallHandlers();
    return crashed;
}
