#ifndef CRASH_GUARD_H
#define CRASH_GUARD_H

#include <Block.h>

/// Run @p block inside a signal-safe crash guard.
/// Returns 0 if the block completed normally, 1 if a fatal signal was caught.
int runWithCrashGuard(void (^block)(void));

#endif /* CRASH_GUARD_H */
