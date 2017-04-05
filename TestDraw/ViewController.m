//
//  ViewController.m
//  TestDraw
//
//  Created by tb on 17/4/5.
//  Copyright © 2017年 com.tb. All rights reserved.
//

#import "ViewController.h"
#import "EnsurePaybackFrontView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    EnsurePaybackFrontView *test = [[EnsurePaybackFrontView alloc]initWithFrame:CGRectMake(15, 168, 290, 400)];
    test.backgroundColor = [UIColor clearColor];
    UIView *dottedLine = [[UIView alloc]initWithFrame:CGRectMake(8, 64, 290 - 16, 1)];
    //绘制虚线
    [self drawDashLine:dottedLine lineLength:8 lineSpacing:4 lineColor:[UIColor blackColor]];
    [test addSubview:dottedLine];
    
    [self.view addSubview:test];
}

/**
 * @param   lineView    需要绘制成虚线的view
 * @param   lineLength  虚线的宽度
 * @param   lineSpacing  虚线的间距
 * @param   lineColor   虚线的颜色
 */
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
