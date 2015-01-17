//
//  SWAppHelper.h
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWHTTPMethod.h"

@interface SWAppHelper : NSObject

+(NSString *)getHttpMethod:(int)httpMethod;

@end
