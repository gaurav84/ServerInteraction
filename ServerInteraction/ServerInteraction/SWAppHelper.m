//
//  SWAppHelper.m
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import "SWAppHelper.h"

@implementation SWAppHelper

+(NSString *)getHttpMethod:(int)httpMethod {
    NSLog();
    
    switch (httpMethod) {
        case HTTP_METHOD_GET:
            return @"GET";
            break;
        case HTTP_METHOD_POST:
            return @"POST";
            break;
        default:
            // If user did not specify anything, returning GET
            return @"GET";
            break;
    }
}

@end
