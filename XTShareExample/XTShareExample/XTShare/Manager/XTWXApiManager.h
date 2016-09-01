//
//  XTWXApiManager.h
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@interface XTWXApiManager : NSObject<WXApiDelegate>

+ (instancetype)sharedManager;

@end
