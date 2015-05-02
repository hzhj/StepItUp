//
//  IMChatViewController.h
//  StepUp
//
//  Created by chenLong on 15/4/28.
//  Copyright (c) 2015年 JFT0M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMChat : UIViewController

+ (NSString *)currentBuddyJid;
+ (void)setCurrentBuddyJid:(NSString *)jid;

- (instancetype)initWithBuddyJID:(NSString *)buddyJID buddyName:(NSString *)buddyName;


@end
