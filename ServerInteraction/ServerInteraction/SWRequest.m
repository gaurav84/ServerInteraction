//
//  SWRequest.m
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import "SWRequest.h"
#import "Validator.h"
#import "SWAppHelper.h"

@implementation SWRequest

// Prepare the request object (of type NSMutableURLRequest)
-(void)makeRequest {
    NSLog();
    
    // Checking if URL is valid
    if(![Validator isUrlValid:self.requestURL.absoluteString]) {
        [self.delegate didFailWithInvalidEmail];
        return;
    }
    
    // Setting a default time out
    if(!self.timeOut) {
        self.timeOut = 20.0;
    }
    
    // Preparing the request object
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.requestURL
                                                                cachePolicy:self.cachePolicy
                                                                timeoutInterval:self.timeOut];
    
    // Setting the HTTPMethod
    request.HTTPMethod = [SWAppHelper getHttpMethod:self.httpMethod];
    
    // Iterating over headerParams and setting corresponding values in Request header
    for(NSString *key in [self.headerParams allKeys]) {
        [request setValue:[self.headerParams valueForKey:key] forHTTPHeaderField:key];
    }
    
    switch (self.requestType) {
        case SYNCHRONOUS:
            [self makeSynchronousRequest];
            break;
        case ASYNCHRONOUS:
            [self makeAsynchronousRequest];
            break;
        default:
            // if no request type is found, request will be asynchronous
            [self makeAsynchronousRequest];
            break;
    }
}

-(void)

@end
