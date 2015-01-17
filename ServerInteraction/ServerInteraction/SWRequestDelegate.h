//
//  SWRequestDelegate.h
//  ServerInteraction
//
//  Created by Gaurav Srivastava on 17/01/15.
//  Copyright (c) 2015 Adroit Business Solution. All rights reserved.
//

#ifndef ServerInteraction_SWRequestDelegate_h
#define ServerInteraction_SWRequestDelegate_h

@protocol SWRequestDelegate <NSObject>

@optional
-(void)didFailWithInvalidEmail;

@end

#endif
