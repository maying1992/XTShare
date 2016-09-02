//
//  XTCheckAppInstalled.m
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTCheckAppInstalled.h"

#import <TencentOpenAPI/QQApiInterface.h>
#import "WXApi.h"
#import "WeiboSDK.h"

@implementation XTCheckAppInstalled

+ (NSMutableArray *)checkAppsInstalled
{
    NSMutableArray * shareOrderArray = [NSMutableArray array];
    if ([QQApiInterface isQQInstalled]) {
        [shareOrderArray addObject:@"1"];
    }
    if ([WXApi isWXAppInstalled]) {
        [shareOrderArray addObject:@"2"];
        [shareOrderArray addObject:@"3"];
    }
    if ([WeiboSDK isWeiboAppInstalled]) {
        [shareOrderArray addObject:@"4"];
    }
    
    return shareOrderArray;
}
@end
