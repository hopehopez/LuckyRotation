//
//  WheelView.m
//  LuckyRotation
//
//  Created by zsq on 16/8/30.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "WheelView.h"
@interface WheelView()

@property (weak, nonatomic) IBOutlet UIImageView *contentV;

@end
@implementation WheelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)wheelView{
    return  [[[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
    }
    return self;
}

//让转盘开始旋转
- (void)rotation{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 3);
    anim.duration = 1;
    anim.repeatCount = MAXFLOAT;
    
    [self.contentV.layer addAnimation:anim forKey:nil];
}
- (void)stop{
    
}
@end
