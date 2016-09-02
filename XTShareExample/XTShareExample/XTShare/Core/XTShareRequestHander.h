//
//  XTShareRequestHander.h
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/QQApiInterface.h>

@interface XTShareRequestHander : NSObject

+ (BOOL)WXSendLinkURL:(NSString *)urlString
              TagName:(NSString *)tagName
                Title:(NSString *)title
          Description:(NSString *)description
           ThumbImage:(UIImage *)thumbImage
              InScene:(enum WXScene)scene;


+ (BOOL)QQSendLinkURL:(NSString *)urlString
                Title:(NSString *)title
          Description:(NSString *)description
           ThumbImage:(NSString *)thumbImage;


+ (BOOL)WBSendLinkURL:(NSString *)urlString
             ObjectID:(NSString *)objectID
                Title:(NSString *)title
          Description:(NSString *)description
           ThumbImage:(NSData *)thumbImage
     ShareMessageFrom:(NSString *)shareMessageFrom;

@end
