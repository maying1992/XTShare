//
//  XTShare.h
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XTShare : NSObject

+ (void)sendShareController:(UIViewController *)controller
                    LinkURL:(NSString *)urlString
                    TagName:(NSString *)tagName
                      Title:(NSString *)title
                Description:(NSString *)description
                 ThumbImage:(NSString *)thumbImage;

@end
