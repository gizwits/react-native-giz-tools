
#import "RNGizTools.h"
#import "RCTCxxBridge+GizExtension.h"

@implementation RNGizTools

static id _instace;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}
- (dispatch_queue_t)methodQueue{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(executeJsCode:(NSDictionary *)info result:(RCTResponseSenderBlock)result){
    NSString *path = [info valueForKey:@"path"];
    NSString *documentPath = [NSString stringWithFormat:@"%@/Documents/%@" , NSHomeDirectory(), path];
    NSString *sandboxPath = [NSString stringWithFormat:@"%@/%@" , NSHomeDirectory(), path];
    NSString *filePath = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        filePath = path;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:documentPath]){
        filePath = documentPath;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:sandboxPath]){
        filePath = sandboxPath;
    }
    if (!filePath || !filePath.length){
        if (result){
            result(@[[NSString stringWithFormat:@"no such file: %@", path]]);
        }
        return;
    }
    NSData *data = [NSData dataWithContentsOfFile: filePath];
    RCTCxxBridge *cxxBridge = (RCTCxxBridge *)[RCTBridge currentBridge];
    if (!cxxBridge){
        if (result){
            result(@[@"no cxxBridge"]);
        }
        return;
    }
    BOOL success = [cxxBridge executeJsCode:data];
    if (result){
        if (success){
            result(@[[NSNull null], @"completion"]);
        } else{
            result(@[@"executeJsCode failed"]);
        }
    }
}

@end

