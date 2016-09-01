//
//  XTShareUI.m
//  XTShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import "XTShareUI.h"

#define ButtonWith            50
#define ALD(x)                (x * kScreenWidth/375.0)
#define kScreenWidth          [UIScreen mainScreen].bounds.size.width
#define LiftEdge              (kScreenWidth - ALD(20) - ButtonWith * 4)/5
#define ButtonDistance        (kScreenWidth - ALD(20) - ButtonWith * 4)/5
#define KdeviceSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]

@interface XTShareUI (){
    int                    liftWith;
    NSInteger              buttonTag;
    NSArray              * shareOrderArray;
}


@property (strong,nonatomic) UIViewController     * controller;
@property (strong,nonatomic) UIAlertController    * alert;
@property (strong,nonatomic) UIActionSheet        * actionSheet;
@property (strong,nonatomic) UIButton             * WXButton;
@property (strong,nonatomic) UIButton             * WXPButton;
@property (strong,nonatomic) UIButton             * QQButton;
@property (strong,nonatomic) UIButton             * WBButton;



@end

@implementation XTShareUI

- (void)presentViewController:(UIViewController *)controller ShareButtonArray:(NSArray *)shareButtonArray
{
    self.controller = controller;
    shareOrderArray = shareButtonArray;
    if (KdeviceSystemVersion >= 8.0) {
        liftWith = LiftEdge;
        [controller presentViewController:self.alert animated:YES completion:nil];
    }else{
        liftWith = LiftEdge + 8;
        [self.actionSheet showInView:controller.navigationController.view];
    }
}

- (UIAlertController *)alert
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"\n\n\n\n\n\n"] message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self addSubviewToAlertview:alert.view];
    return alert;
}

- (UIActionSheet *)actionSheet
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"\n\n\n\n\n\n"] delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil];
    [self addSubviewToAlertview:actionSheet];
    return actionSheet;
}

- (UIButton *)QQButton
{
    return [self createButtonTitle:@"QQ好友" ImageNamed:@"Shared_QQ" Tag:111001];
}

- (UIButton *)WXPButton
{
    return [self createButtonTitle:@"朋友圈" ImageNamed:@"Shared_Friend" Tag:111002];
}

- (UIButton *)WXButton
{
    return [self createButtonTitle:@"微信好友" ImageNamed:@"Shared_Wechat" Tag:111003];
}

- (UIButton *)WBButton
{
    return [self createButtonTitle:@"新浪微博" ImageNamed:@"Shared_Weibo" Tag:111004];
}

- (UIButton *)createButtonTitle:(NSString *)title ImageNamed:(NSString *)imageNamed Tag:(int)tag
{
    NSInteger tagNum = buttonTag - 111000;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(liftWith + (ButtonDistance + ButtonWith) * (tagNum - 1), ALD(35), ButtonWith, ButtonWith);
    
    [button addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setBackgroundImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    //    [button setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(80, 0, 0, 0)];
    
    return button;
}


- (void)addSubviewToAlertview:(id)alert
{
    NSInteger buttonsNum = shareOrderArray.count;
    while (buttonsNum != 0) {
        for (int i = 0; i< shareOrderArray.count; i++) {
            buttonTag = i + 111001;
            switch ([shareOrderArray[i] integerValue]) {
                case 1:
                    [alert addSubview:self.QQButton];
                    buttonsNum --;
                    break;
                case 2:
                    [alert addSubview:self.WXPButton];
                    buttonsNum --;
                    break;
                case 3:
                    [alert addSubview:self.WXButton];
                    buttonsNum --;
                    break;
                case 4:
                    [alert addSubview:self.WBButton];
                    buttonsNum --;
                    break;
                default:
                    break;
            }
        }
    }
}

#pragma mark - ButtonAction
- (void)shareButtonAction:(UIButton *)button
{
    NSInteger tag = button.tag - 111000;
    switch (tag) {
        case 1:
            [_delegate choiceButtonTpye:buttonTypeOfQQ];
            break;
        case 2:
            [_delegate choiceButtonTpye:buttonTypeOfWXF];
            break;
        case 3:
            [_delegate choiceButtonTpye:buttonTypeOfWX];
            break;
        case 4:
            [_delegate choiceButtonTpye:buttonTypeOfWB];
            break;
        default:
            break;
    }
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}
@end
