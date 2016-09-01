//
//  XTQQApiManager.m
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTQQApiManager.h"

@implementation XTQQApiManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static XTQQApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XTQQApiManager alloc]init];
    });
    return instance;
}

#pragma mark - QQApiInterfaceDelegate
- (void)onResp:(QQBaseResp *)resp
{
    if ([resp.result integerValue] == 0) {
        UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:nil message:@"分享成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [msgbox show];
    }
}

- (void)onReq:(QQBaseReq *)req
{
    
}

- (void)isOnlineResponse:(NSDictionary *)response
{
    
}

@end
