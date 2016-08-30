//
//  WheelView.h
//  LuckyRotation
//
//  Created by zsq on 16/8/30.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WheelView : UIView

//快速创建一个转盘
+ (instancetype)wheelView;

//开始旋转
- (void)rotation;
//暂停旋转
- (void)stop;
@end
