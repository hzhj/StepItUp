//
//  IMQNFileLoadUtil.h
//  JLWeChat
//
//  Created by jimneylee on 14-10-25.
//  Copyright (c) 2014年 jimneylee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QNResourceManager : NSObject

+ (instancetype)sharedManager;

- (void)uploadImage:(UIImage *)image
          keyPrefix:(NSString *)keyPrefix
      completeBlock:(void (^)(BOOL success,  NSString *key, CGFloat width, CGFloat height))completeBlock;

//upload file with urlkey
- (void)uploadFileWithUrlkey:(NSString *)urlkey
               progressBlock:(void (^)(NSString *key, float progress))progressBlock
               completeBlock:(void (^)(BOOL success,  NSString *key))completeBlock;

// download file with url
- (void)downloadFileWithUrl:(NSString*)url
              progressBlock:(void (^)(CGFloat progress))progressBlock
              completeBlock:(void (^)(BOOL success, NSError *error))completeBlock;

// yyyy-MM-dd-HH-mm-ss.jpg
+ (NSString *)generateImageTimeKeyWithPrefix:(NSString *)keyPrefix;

// yyyy-MM-dd-HH-mm-ss.voice
+ (NSString *)generateAudioTimeKeyWithPrefix:(NSString *)keyPrefix;

@end
