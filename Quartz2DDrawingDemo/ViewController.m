//
//  ViewController.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/5.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "ViewController.h"
#import "ExamplesTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ExamplesTableViewController *tv = [[ExamplesTableViewController alloc] init];
    [self pushViewController:tv animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
