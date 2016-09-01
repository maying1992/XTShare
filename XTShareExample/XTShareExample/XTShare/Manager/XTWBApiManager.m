//
//  XTWBApiManager.m
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTWBApiManager.h"

@implementation XTWBApiManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static XTWBApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XTWBApiManager alloc]init];
    });
    return instance;
}


- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if((int)response.statusCode == 0){
        //分享成功
        [self alertShow];
    }
}

- (void)alertShow
{
    UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:nil message:@"分享成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [msgbox show];
}

@end
