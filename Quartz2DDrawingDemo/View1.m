//
//  View1.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/5.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "View1.h"

@implementation View1

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    {
        //获取当前图形上下文
        CGMutablePathRef path = CGPathCreateMutable();
        //构建线段
        CGPathMoveToPoint(path, nil, 10, 124);
        CGPathAddLineToPoint(path, nil, self.bounds.size.width-10,124);
        CGPathAddLineToPoint(path, nil, self.bounds.size.width/2, 164);
        CGPathAddLineToPoint(path, nil, 10, 124);
        //添加路径到上下文
        CGContextAddPath(context, path);
        //端点形状
        CGContextSetLineCap(context, kCGLineCapButt);
        //交点形状
        CGContextSetLineJoin(context, kCGLineJoinRound);
        //线宽
        CGContextSetLineWidth(context, 3.0);
        //线条颜色
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        //绘制
        CGContextDrawPath(context, kCGPathStroke);
        //对象释放
        CGPathRelease(path);
    }
    
    {
        CGContextAddEllipseInRect(context, CGRectMake((self.bounds.size.width-200)/2, 194, 200, 150));
        CGContextSetLineWidth(context, 3.0);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
        CGContextSetShadow(context, CGSizeMake(2, 2), 0.9);
        
        CGContextDrawPath(context, kCGPathFillStroke);
        
    }
    
}

@end
