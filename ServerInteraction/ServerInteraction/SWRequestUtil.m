//
//  SWRequestUtil.m
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import "SWRequestUtil.h"
#import "SWValidator.h"
#import "SWRequestType.h"
#import "SWHTTPMethod.h"
#import "SWAppHelper.h"

@implementation SWRequestUtil

-(void)makeRequest:(SWRequest *)request withCompletionHandler:(void (^)(NSData *response, NSError *error))completionHandler {
    NSLog();
    
    // Checking if URL is valid
    if(![SWValidator isUrlValid:request.serverURL.absoluteString]) {
        NSLog(@"Invalid URL");
        return;
    }
    
    // Setting a default time out
    if(!request.timeOut) {
        timeOut = 20.0;
    }
    
    // Preparing the request object
    NSMutableURLRequest *serverRequest = [[NSMutableURLRequest alloc] initWithURL:request.serverURL
                                                                cachePolicy:cachePolicy
                                                            timeoutInterval:timeOut];
    
    // Setting the HTTPMethod
    serverRequest.HTTPMethod = [SWAppHelper getHttpMethod:request.httpMethod];
    
    // Iterating over headerParams and setting corresponding values in Request header
    for(NSString *key in [request.headerParams allKeys]) {
        [serverRequest setValue:[request.headerParams valueForKey:key] forHTTPHeaderField:key];
    }
    
    NSURLResponse *response = nil;
    NSError *error;
    
    switch (request.requestType) {
        case REQUEST_TYPE_SYNCHRONOUS: {
            NSData *data = [NSURLConnection sendSynchronousRequest:serverRequest returningResponse:&response error:&error];
            completionHandler(data, error);
            break;
        }
        case REQUEST_TYPE_ASYNCHRONOUS: {
            NSOperationQueue *queue = [[NSOperationQueue alloc] init];

            [NSURLConnection sendAsynchronousRequest:serverRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                completionHandler(data, error);
            }];
            break;
        }
        default:
            // if no request type is found, request will be asynchronous
            
            break;
    }
    
    
}

@end
