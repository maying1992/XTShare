//
//  XTShareManager.m
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTShareManager.h"

#import "XTQQApiManager.h"
#import "XTWXApiManager.h"
#import "XTWBApiManager.h"

#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

#define ShareSDK_WeChat_AppID       @"wxbc9b1c41bc545d88"
#define ShareSDK_QQ_AppID           @"1104672593"
#define ShareSDK_Weibo_AppID        @"1313230198"

@implementation XTShareManager

+ (void)initShareEnviroment
{
    //注册微信
    [WXApi registerApp:ShareSDK_WeChat_AppID];
    //向微信注册支持的文件类型
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    [WXApi registerAppSupportContentFlag:typeFlag];
    
    //注册QQ
    [[TencentOAuth alloc] initWithAppId:ShareSDK_QQ_AppID andDelegate:[XTQQApiManager sharedManager]];
    
    //注册微博
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:ShareSDK_Weibo_AppID];
    
}

+ (void)shareHandleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication
{
    if ([sourceApplication isEqualToString:@"com.tencent.xin"]) {
        [WXApi handleOpenURL:url delegate:[XTWXApiManager sharedManager]];
    }else if ([sourceApplication isEqualToString:@"com.tencent.mqq"]) {
        [QQApiInterface handleOpenURL:url delegate:[XTQQApiManager sharedManager]];
    }else{
        [WeiboSDK handleOpenURL:url delegate:[XTWBApiManager sharedManager]];
    }
}

+ (void)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options
{
    NSString * sourceApplication = [options objectForKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
    if ([sourceApplication isEqualToString:@"com.tencent.xin"]) {
        [WXApi handleOpenURL:url delegate:[XTWXApiManager sharedManager]];
    }else if ([sourceApplication isEqualToString:@"com.tencent.mqq"]) {
        [QQApiInterface handleOpenURL:url delegate:[XTQQApiManager sharedManager]];
    }else{
        [WeiboSDK handleOpenURL:url delegate:[XTWBApiManager sharedManager]];
    }
}

@end
