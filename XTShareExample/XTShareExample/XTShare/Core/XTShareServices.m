//
//  XTShareServices.m
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTShareServices.h"

#import "XTCheckAppInstalled.h"
#import "XTShareRequestHander.h"

@interface XTShareServices(){
    
}

@property (nonatomic, strong) XTShareUI                 * shareUI;
@property (nonatomic, strong) UIViewController          * controller;
@property (nonatomic, strong) NSString                  * shareUrl;
@property (nonatomic, strong) NSString                  * shareTagName;
@property (nonatomic, strong) NSString                  * shareTitle;
@property (nonatomic, strong) NSString                  * shareDescription;
@property (nonatomic, strong) UIImage                   * shareThumbImage;
@property (nonatomic, strong) NSData                    * shareThumbImageData;
@property (nonatomic, strong) NSString                  * shareThumbImageString;

@end



@implementation XTShareServices

+ (instancetype)sharedServices
{
    static dispatch_once_t onceToken;
    static XTShareServices *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XTShareServices alloc]init];
    });
    return instance;
}

- (void)choiceButtonTpye:(ShareButtonType)buttonType
{
    switch (buttonType) {
        case buttonTypeOfQQ:
            [XTShareRequestHander QQSendLinkURL:self.shareUrl Title:self.shareTitle Description:self.shareDescription ThumbImage:self.shareThumbImageString];
            break;
        case buttonTypeOfWXF:
            [XTShareRequestHander WXSendLinkURL:self.shareUrl TagName:self.shareTagName Title:self.shareTitle Description:self.shareDescription ThumbImage:self.shareThumbImage InScene:WXSceneTimeline];
            break;
        case buttonTypeOfWX:
            [XTShareRequestHander WXSendLinkURL:self.shareUrl TagName:self.shareTagName Title:self.shareTitle Description:self.shareDescription ThumbImage:self.shareThumbImage InScene:WXSceneSession];
            break;
        case buttonTypeOfWB:
            [XTShareRequestHander WBSendLinkURL:self.shareUrl ObjectID:self.shareTagName Title:self.shareTitle Description:self.shareDescription ThumbImage:self.shareThumbImageData ShareMessageFrom:@""];
            break;
            
        default:
            break;
    }
}

- (void)ShareSendController:(UIViewController *)controller
                    LinkURL:(NSString *)urlString
                    TagName:(NSString *)tagName
                      Title:(NSString *)title
                Description:(NSString *)description
                 ThumbImage:(NSString *)thumbImage
{
    NSArray * shareButtonArray = [XTCheckAppInstalled checkAppsInstalled];
    if (shareButtonArray.count == 0) {
        UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:nil message:@"没有可分享的应用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [msgbox show];
    }else{
        
        self.shareUI = [[XTShareUI alloc]init];
        self.shareUI.delegate = self;
        [self.shareUI presentViewController:controller ShareButtonArray:shareButtonArray];
        
    }
    self.shareUrl         = urlString;
    self.shareTagName     = tagName;
    self.shareTitle       = title;
    self.shareDescription = description;
    self.shareThumbImageString = thumbImage;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData * data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:thumbImage]];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.shareThumbImageData = [self imageWithImage:image scaledToSize:CGSizeMake(150, 150)];
                self.shareThumbImage = [[UIImage alloc]initWithData:_shareThumbImageData];
            });
        }
    });
}

- (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.5);
}

@end
