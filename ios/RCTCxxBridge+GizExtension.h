//
//  RCTCxxBridge+GizExtension.h
//  RNGizTools
//
//  Created by Pp on 2/22/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridge+Private.h>

@interface RCTCxxBridge (GizExtension)
- (BOOL)executeJsCode:(NSData *)data;
@end
