import CrashGuard

/// Returns `true` if `body` triggered a fatal signal (SIGTRAP, SIGABRT, etc.).
public func withCrashGuard(_ body: @escaping () -> Void) -> Bool {
    runWithCrashGuard { body() } != 0
}
