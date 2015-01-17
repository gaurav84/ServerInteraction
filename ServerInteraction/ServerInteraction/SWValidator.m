//
//  ClientSideValidator.m
//  Glad2 Project
//
//  Created by Gaurav Srivastava on 28/06/13.
//  Copyright (c) 2013 Gaurav Srivastava. All rights reserved.
//

#import "SWValidator.h"

@implementation SWValidator

+(BOOL)isTextNil:(NSString *)text {
    NSString *trimmed = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(trimmed.length < 1)
        return YES;
    else
        return NO;
}

+(BOOL)isEmailValid:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)isPasswordValid:(NSString *)password {
    NSString *trimmed = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(trimmed.length < 8)
        return NO;
    else
        return YES;
}

+(BOOL)containOnlyAlphabets:(NSString *)text {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"[0-9]" options:0 error:NULL];
    
    NSUInteger matches = [regex numberOfMatchesInString:text options:0 range:NSMakeRange(0, [text length])];
    
    if (matches > 0)
        return false;
    else
        return true;
}

+(BOOL)isUrlValid:(NSString *)urlString {
    NSURL *candidateURL = [NSURL URLWithString:urlString];
    if (candidateURL && candidateURL.scheme && candidateURL.host) {
        return YES;
    }
    else {
        return NO;
    }
}

+(BOOL)isPasswordValidForFirstField:(NSString *)password andLastField:(NSString *)newPassword {
    NSLog();
    if([password isEqualToString:newPassword])
        return YES;
    else
        return NO;
}

@end
