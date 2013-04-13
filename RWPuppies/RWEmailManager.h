//
//  RWEmailManager.h
//  RWPuppies
//
//  Created by Pietro Rea on 1/2/13.
//  Copyright (c) 2013 Pietro Rea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWEmailManager : NSObject

- (id)initWithRecipient:(NSString*)name recipientEmail:(NSString *)email;

- (void)sendConfirmationEmail;

- (void)sendConfirmationEmailWithSuccessBlock:(void(^)(void))successBlock
                                 failureBlock:(void(^)(void))failureBlock;

@end