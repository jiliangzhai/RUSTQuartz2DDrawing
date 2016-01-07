//
//  ExamplesViewController.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/5.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "ExamplesViewController.h"
#import "ExamplesViewController.h"

@interface ExamplesViewController ()


@end

@implementation ExamplesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor grayColor];
    
    if (_subView) {
        __weak UIView*view = _subView;
        view.backgroundColor = [UIColor grayColor];
        [self.view addSubview:view];
        
    }else if (!_isPDF)
    {
        UIImage *image = [self imageMaker];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width,image.size.height)];
        imageView.image = image;
        imageView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
        [self.view addSubview:imageView];
    }else
    {
        NSString* path = [self PDFmaker];
        UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
        [self.view addSubview:webview];
        
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webview loadRequest:request];
    }
}

- (UIImage *)imageMaker
{
    CGSize size = CGSizeMake(200, 200);
    //创建位图上下文
    UIGraphicsBeginImageContext(size);
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 200) cornerRadius:100];
    //路径裁剪
    [path addClip];
    
    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    CGSize imageSize = image.size;
    //调整绘制区域
    float ratioX = 200/imageSize.width;
    float ratioY = 200/imageSize.height;
    float ratio = MAX(ratioX, ratioY);
    
    float originX = (200-ratio*imageSize.width)/2.0;
    float originy = (200-ratio*imageSize.height)/2.0;
    //图片绘制
    [image drawInRect:CGRectMake(originX, originy, ratio*imageSize.width,ratio*imageSize.height)];
    //获得图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (NSString *)PDFmaker
{
    NSArray *direstories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[direstories lastObject] stringByAppendingPathComponent:@"rustPDF.pdf"];
    
    UIGraphicsBeginPDFContextToFile(path, CGRectZero, [NSDictionary dictionaryWithObjectsAndKeys:@"rust",kCGPDFContextAuthor, nil]);
    UIGraphicsBeginPDFPage();
    
    NSString *title = @"This is a PDF";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    [title drawInRect:CGRectMake(0, 30, 612, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSParagraphStyleAttributeName:style}];
    NSString *content = @"this hit,that ice cold,Michelle Pfeiffer,that white gold,this one,for them hood girl,them good girl,straight masterpieces.";
    NSMutableParagraphStyle *style2 = [[NSMutableParagraphStyle alloc] init];
    style2.alignment = NSTextAlignmentLeft;
    [content drawInRect:CGRectMake(30, 100, 600, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor grayColor],NSParagraphStyleAttributeName:style2}];
    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    [image drawInRect:CGRectMake(120, 150, 397, 220)];
    
    UIGraphicsEndPDFContext();
    
    return path;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
