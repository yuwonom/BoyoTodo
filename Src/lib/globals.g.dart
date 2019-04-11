///
/// NOTE: This file will be replaced during a CI build, which has two implications:
///         1. You can freely modify variable values for the purposes of development without impacting the binaries produced by CI.
///         2. Adding or removing variables will require corresponding updates to the build script.
///

/// Whether to execute in disconnected more or not.
bool disconnected = true;

/// If [disconnected] is `true`, determines whether to include random, fake delays.
bool disconnectedDelays = true;

/// If [disconnected] is `true`, determines whether to include random, fake errors.
bool disconnectedErrors = false;