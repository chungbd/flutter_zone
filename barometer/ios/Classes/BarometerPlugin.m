#import "BarometerPlugin.h"
#if __has_include(<barometer/barometer-Swift.h>)
#import <barometer/barometer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "barometer-Swift.h"
#endif

@implementation BarometerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBarometerPlugin registerWithRegistrar:registrar];
}
@end
