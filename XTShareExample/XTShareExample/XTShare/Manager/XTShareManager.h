//
//  XTShareManager.h
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XTShareManager : NSObject

+ (void)initShareEnviroment;

+ (void)shareHandleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication;

+ (void)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options;

@end
