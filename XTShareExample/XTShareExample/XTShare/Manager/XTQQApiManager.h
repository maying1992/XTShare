//
//  XTQQApiManager.h
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface XTQQApiManager : NSObject<QQApiInterfaceDelegate>

+ (instancetype)sharedManager;

@end
