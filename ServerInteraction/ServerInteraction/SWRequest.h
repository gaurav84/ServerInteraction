//
//  SWRequest.h
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWRequestType.h"
#import "SWHTTPMethod.h"
#import "SWErrorCode.h"
#import "SWRequestDelegate.h"

@interface SWRequest : NSObject

/*
 URL of the destination server
 */
@property (nonatomic, strong) NSURL *requestURL;

/*
 HTTP Method - GET/POST
 Optional, Default: GET
 */
@property (nonatomic, assign) SWHTTPMethod httpMethod;

/*
 Type of request - Synchronous/Asynchronous
 Optional, Default: Async
 */
@property (nonatomic, assign) SWRequestType requestType;

/*
 Optional
 Cache policy for the request.
 */
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;

/*
 Optional
 Params required to be added in HTTPHeader
 */
@property (nonatomic, strong) NSDictionary *headerParams;

/*
 Optional
 Timeout (in seconds) for request
 */
@property (nonatomic, assign) int timeOut;

/*
 Delegate to handle success/failure/error callbacks
 */
@property (nonatomic, weak) id<SWRequestDelegate> delegate;

/**
 Prepares the request object, based on the set values.
 */
-(void)makeRequest;

@end
