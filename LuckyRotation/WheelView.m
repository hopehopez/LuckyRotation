//
//  WheelView.m
//  LuckyRotation
//
//  Created by zsq on 16/8/30.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "WheelView.h"
#import "WheelButton.h"
#define angle2Rad(angle) ((angle)/180.0 * M_PI)

@interface WheelView()

@property (weak, nonatomic) IBOutlet UIImageView *contentV;

@property (nonatomic, strong) WheelButton *selectedBtn;

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
- (void)awakeFromNib{
    //添加转盘按钮
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat angle = 0;
    for (int i = 0; i<12; i++) {
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);

        //设置按钮旋转状态下的图片
        [btn setImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        //设置按钮位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        //让第一个按钮在上一个基础上面旋转30
        btn.transform = CGAffineTransformMakeRotation(angle2Rad(angle));
        angle += 30;
        
        //监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentV addSubview:btn];
    }
}
- (void)btnClick:(WheelButton *)btn{
    
//    for (UIView *view in self.contentV.subviews) {
//        if ([view isKindOfClass:[UIButton class]]) {
//            UIButton *button = (UIButton *)view;
//            button.selected = NO;
//        }
//    }
    self.selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    self.selectedBtn = btn;
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
    [self.contentV.layer removeAllAnimations];
}
@end
