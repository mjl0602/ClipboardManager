#import "ClipboardManagerPlugin.h"

@implementation ClipboardManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftClipboardManagerPlugin registerWithRegistrar:registrar];
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"clipboard_manager"
            binaryMessenger:[registrar messenger]];
  ClipboardManagerPlugin* instance = [[ClipboardManagerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"copyToClipBoard" isEqualToString:call.method]) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = call.arguments;
        result(true);
    }
}
@end
