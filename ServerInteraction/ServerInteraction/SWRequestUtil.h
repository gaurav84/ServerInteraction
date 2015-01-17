//
//  SWRequestUtil.h
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWRequest.h"

@interface SWRequestUtil : NSObject {
    int timeOut;
    NSURLRequestCachePolicy cachePolicy;
}

-(void)makeRequest:(SWRequest *)request withCompletionHandler:(void (^)(NSData *response, NSError *error))completionHandler;

@end
