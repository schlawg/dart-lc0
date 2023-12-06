#import "Lc0Plugin.h"
#import "ffi.h"

@implementation Lc0Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  if (registrar == NULL) {
    // avoid dead code stripping
    Lc0_main();
    Lc0_stdin_write(NULL);
    Lc0_stdout_read();
  }
}

@end
