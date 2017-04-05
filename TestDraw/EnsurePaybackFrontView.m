//
//  EnsurePaybackFrontView.m
//  MaYiJieKuan
//
//  Created by Noah on 17/4/3.
//  Copyright © 2017年 tb. All rights reserved.
//

#import "EnsurePaybackFrontView.h"

@implementation EnsurePaybackFrontView
{
    //虚线距view顶部的距离
    CGFloat _frontHeight;
    //中间两个小半圆的半径
    CGFloat _radii;
    //顶部view的圆角半径
    CGFloat _topRadius;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        _frontHeight = 64.f;
        _radii = 8.f;
        _topRadius = 4.f;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat viewWidth = rect.size.width;
    CGFloat viewHieght = rect.size.height;
    
    //获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //绘制整体背景
    CGContextMoveToPoint(ctx, _topRadius, 0);
    CGContextAddLineToPoint(ctx, viewWidth - _topRadius, 0);
    CGContextAddArc(ctx, viewWidth - _topRadius, _topRadius, _topRadius, 3/2*M_PI, 0, 0);
    CGContextAddLineToPoint(ctx, viewWidth, _frontHeight - _radii);
    CGContextAddArc(ctx, viewWidth, _frontHeight, _radii, 1.5 * M_PI, -M_PI_2, 1);
    CGContextAddLineToPoint(ctx, viewWidth, viewHieght);
    CGContextAddLineToPoint(ctx, 0, viewHieght);
    CGContextAddLineToPoint(ctx, 0, _frontHeight + _radii);
    CGContextAddArc(ctx, 0, _frontHeight, _radii, -M_PI_2, 3 * M_PI_2, 1);
    CGContextAddLineToPoint(ctx, 0, _topRadius);
    CGContextAddArc(ctx, _topRadius, _topRadius, _topRadius, M_PI, M_PI * 1.5, 0);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
    
    //绘制左边半圆
    CGContextMoveToPoint(ctx, 0, _frontHeight - _radii);
    CGContextAddArc(ctx, 0, _frontHeight, _radii, 3 * M_PI_2, - M_PI_2, 0);
//    CGContextAddLineToPoint(ctx, 0, _frontHeight - _radii);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:32/255.0 green:170/255.0 blue:251/255.0 alpha:1.0].CGColor);
//    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
}

@end
