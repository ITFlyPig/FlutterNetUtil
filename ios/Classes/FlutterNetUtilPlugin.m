#import "FlutterNetUtilPlugin.h"
#import <flutter_net_util/flutter_net_util-Swift.h>

@implementation FlutterNetUtilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterNetUtilPlugin registerWithRegistrar:registrar];
}
@end
