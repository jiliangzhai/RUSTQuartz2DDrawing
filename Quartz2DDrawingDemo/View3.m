//
//  View3.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/6.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "View3.h"

@implementation View3

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    //平移
    CGContextTranslateCTM(context,90, 50);
    //缩小
    CGContextScaleCTM(context, 0.8,0.8);
    //旋转
    CGContextRotateCTM(context, M_PI_4/4);
        
    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    //在上下文中绘制图像
    [image drawInRect:CGRectMake(0, 74, 240, 180)];
        
    CGContextRestoreGState(context);
   
}

@end
