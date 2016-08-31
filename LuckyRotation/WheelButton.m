//
//  WheelButton.m
//  LuckyRotation
//
//  Created by zsq on 16/8/30.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "WheelButton.h"

@implementation WheelButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//返回当前按钮当中图片的位置尺寸
//当前按钮的位置尺寸
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w = 40;
    CGFloat h = 48;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;

    return CGRectMake(x, y, w, h);
}

//- (CGRect)titleRectForContentRect:(CGRect)contentRect{
//    return contentRect;
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height* 0.5);
    if (CGRectContainsPoint(rect, point)) {
        return [super hitTest:point withEvent:event];
    }else {
        return nil;
    }
}

//取消高亮状态下作的事
- (void)setHighlighted:(BOOL)highlighted{
    
}
@end
