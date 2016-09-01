//
//  XTShareUI.h
//  XTCustomShare
//
//  Created by XT Xiong on 16/9/1.
//  Copyright © 2016年 XT Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    buttonTypeOfQQ,
    buttonTypeOfWXF,
    buttonTypeOfWX,
    buttonTypeOfWB
}ShareButtonType;

@protocol XTShareUIDelegate <NSObject>

- (void)choiceButtonTpye:(ShareButtonType)buttonType;

@end

@interface XTShareUI : UIView

@property (nonatomic,assign)id<XTShareUIDelegate>delegate;

- (void)presentViewController:(UIViewController *)controller ShareButtonArray:(NSArray *)shareButtonArray;

@end
