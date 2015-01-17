//
//  ClientSideValidator.h
//  Glad2 Project
//
//  Created by Gaurav Srivastava on 28/06/13.
//  Copyright (c) 2013 Gaurav Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWValidator : NSObject

+(BOOL)isTextNil:(NSString *)text;
+(BOOL)isEmailValid:(NSString *)email;
+(BOOL)isPasswordValid:(NSString *)password;
+(BOOL)containOnlyAlphabets:(NSString *)text;
+(BOOL)isUrlValid:(NSString *)urlString;
+(BOOL)isPasswordValidForFirstField:(NSString *)password andLastField:(NSString *)newPassword;

@end
