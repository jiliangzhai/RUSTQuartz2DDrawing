//
//  View2.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/6.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "View2.h"

@implementation View2

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    {
        //储存当先图形上下文状态
        CGContextSaveGState(context);
        //裁减图形上下文
        CGContextClipToRect(context, CGRectMake((rect.size.width-200)/2, 84, 200, 200));
        //构建颜色空间，这里选择RGB
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        //创建3个颜色
        CGFloat component[12] = {191.0/255.0,21.0/255.0,133.0/255.0,1,218.0/255.0,112.0/255.0,214.0/255.0,1.0,216.0/255.0,191.0/255.0,216.0/255.0,1.0};
        //3个颜色对应的填充区域的位置
        CGFloat locations[3] = {0,0.3,1.0};
        //创建CGGradientRef
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, component, locations, 3);
        //确定起始点和终点，选择进行线性渐变
        //kCGGradientDrawsAfterEndLocation表征开始位置之前不进行填充，结束位置后继续填充
        //kCGGradientDrawsBeforeStartLocation表征开始位置之前进行填充，结束位置后不进行填充
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(200,200), kCGGradientDrawsAfterEndLocation);
        //恢复图形上下文状态
        CGContextRestoreGState(context);
        //对象释放
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
    }
    
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGFloat component[12] = {191.0/255.0,21.0/255.0,133.0/255.0,1,218.0/255.0,112.0/255.0,214.0/255.0,1.0,216.0/255.0,191.0/255.0,216.0/255.0,1.0};
        CGFloat locations[3] = {0,0.3,1.0};
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, component, locations, 3);
        //确定起始起始半径，结束位置结束半径，选择进行径向填充。
        CGContextDrawRadialGradient(context, gradient, CGPointMake(rect.size.width/2,404 ), 0, CGPointMake(rect.size.width/2, 404), 100, kCGGradientDrawsBeforeStartLocation);
        
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
    }
    
}

@end
