//
//  XTShare.m
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTShare.h"
#import "XTShareServices.h"

@implementation XTShare

+ (void)sendShareController:(UIViewController *)controller
                    LinkURL:(NSString *)urlString
                    TagName:(NSString *)tagName
                      Title:(NSString *)title
                Description:(NSString *)description
                 ThumbImage:(NSString *)thumbImage
{
    [[XTShareServices sharedServices] ShareSendController:controller
                                                  LinkURL:urlString
                                                  TagName:tagName
                                                    Title:title
                                              Description:description
                                               ThumbImage:thumbImage];
}

@end
