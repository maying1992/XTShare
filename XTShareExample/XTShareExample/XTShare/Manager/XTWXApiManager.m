//
//  XTWXApiManager.m
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTWXApiManager.h"

@implementation XTWXApiManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static XTWXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XTWXApiManager alloc]init];
    });
    return instance;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp*)resp
{
    if (resp.errCode == 0) {
        [self alertShow];
    }else{
        NSLog(@"微信分享失败 /n errCode:%d /n errStr:%@",resp.errCode,resp.errStr);
    }
}

- (void)onReq:(BaseReq*)req
{

}


- (void)alertShow
{
    UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:nil message:@"分享成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [msgbox show];
}

@end
