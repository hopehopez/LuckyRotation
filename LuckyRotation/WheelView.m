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

@property (nonatomic, strong) CADisplayLink *link;

@end
@implementation WheelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CADisplayLink *)link{
    if (_link == nil) {
        //添加定时器, 保持一直旋转
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}

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
    
    //加载原始大图
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *oriSelectedImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    CGFloat x = 0;
    CGFloat y = 0;
    NSLog(@"%f",[UIScreen mainScreen].scale);
    CGFloat clipW = oriImage.size.width / 12.0 * 2;
    CGFloat clipH = oriImage.size.height * 2;
    
    

    for (int i = 0; i<12; i++) {
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);

        //设置按钮旋转状态下的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        //设置按钮正常状态下的图片
        //给定一张图片, 截取指定区域范围内的图片
        x = i * clipW;
        //CGImageCreateWithImageInRect, 使用的坐标都是以一像素点
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, CGRectMake(x, y, clipW, clipH));
        [btn setImage:[UIImage imageWithCGImage:clipImage] forState:UIControlStateNormal];
        
        CGImageRef clipSelectedImage = CGImageCreateWithImageInRect(oriSelectedImage.CGImage, CGRectMake(x, y, clipW, clipH));
        [btn setImage:[UIImage imageWithCGImage:clipSelectedImage] forState:UIControlStateSelected];
        
        
        
        //设置按钮位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        //让第一个按钮在上一个基础上面旋转30
        btn.transform = CGAffineTransformMakeRotation(angle2Rad(angle));
        angle += 30;
        
        //监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentV addSubview:btn];
        
        if (i == 0) {
            [self btnClick:btn];
        }
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
- (IBAction)startRotation:(UIButton *)sender {
    
    [self rotation];
}

//让转盘开始旋转
- (void)rotation{
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI * 3);
//    anim.duration = 5;
//    anim.repeatCount = MAXFLOAT;
//    
//    [self.contentV.layer addAnimation:anim forKey:nil];
    
    
    self.link.paused = NO;
    
}

- (void)update{
    self.contentV.transform = CGAffineTransformRotate(self.contentV.transform, M_PI/300);
}

- (void)stop{
    self.link.paused = YES;
}
@end
