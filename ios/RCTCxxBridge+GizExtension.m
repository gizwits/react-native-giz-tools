//
//  RCTCxxBridge+GizExtension.m
//  RNGizTools
//
//  Created by Pp on 2/22/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTCxxBridge+GizExtension.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation RCTCxxBridge (GizExtension)
- (BOOL)executeJsCode:(NSData *)data{
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList([self class], &methodCount);
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        if ([NSStringFromSelector(selector) isEqualToString:@"executeSourceCode:sync:"]) {
            ((void (*)(id, SEL, NSData *, BOOL))objc_msgSend)(self, selector, data, NO);
            return YES;
        }
    }
    return NO;
}
@end
