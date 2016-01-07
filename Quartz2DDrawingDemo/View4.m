//
//  View4.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/6.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "View4.h"

@implementation View4

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建填充的颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, colorSpace);
    //callback方法
    CGPatternCallbacks callBack = {0,&drawTile,NULL};
    //根据callback方法创建自定义样式
    CGPatternRef pattern = CGPatternCreate(NULL, CGRectMake(0, 0, 40, 40), CGAffineTransformIdentity, 40, 40, kCGPatternTilingNoDistortion, true, &callBack);
    CGFloat alpha = 1.0;
    //设置图形上下文的填充样式
    CGContextSetFillPattern(context, pattern, &alpha);
    //绘制图形
    CGContextFillRect(context, rect);
    
    CGPatternRelease(pattern);
    CGColorSpaceRelease(colorSpace);
}
//callback方法，在该方法中绘制了自定义样式
void drawTile(void *info,CGContextRef context)
{
    CGContextSetRGBFillColor(context, 235.0/255.0, 127.0/255.0, 175.0/255.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, 20, 20));
    CGContextFillRect(context, CGRectMake(20, 20, 40, 40));
    
    CGContextSetRGBFillColor(context, 140.0/255.0, 179.0/255.0, 62.0/255.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 20, 20, 20));
    CGContextFillRect(context, CGRectMake(20, 0, 20, 20));
}
@end
