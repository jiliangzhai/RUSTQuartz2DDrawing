//
//  ExamplesTableViewController.m
//  Quartz2DDrawingDemo
//
//  Created by rust_33 on 16/1/5.
//  Copyright © 2016年 rust_33. All rights reserved.
//

#import "ExamplesTableViewController.h"
#import "ExamplesViewController.h"
#import "View1.h"
#import "View2.h"
#import "View3.h"
#import "View4.h"

@interface ExamplesTableViewController (){
    
    NSMutableArray *cellNames;
    NSMutableArray *Views;
}

@end

@implementation ExamplesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellNames = [[NSMutableArray alloc] init];
    [cellNames addObject:@"基本图形绘制"];
    [cellNames addObject:@"渐变填充"];
    [cellNames addObject:@"图形上下文形变"];
    [cellNames addObject:@"有颜色填充模式"];
    [cellNames addObject:@"位图绘制"];
    [cellNames addObject:@"PDF绘制"];
    
    Views = [[NSMutableArray alloc] init];
    View1 *view1 = [[View1 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [Views addObject:view1];
    
    View2 *view2 = [[View2 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [Views addObject:view2];
    
    View3 *view3 = [[View3 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [Views addObject:view3];
    
    View4 *view4 = [[View4 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [Views addObject:view4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return cellNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rust"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rust"];
    }
    
    cell.textLabel.text = cellNames[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 4) {
        
        ExamplesViewController *vc = [[ExamplesViewController alloc] init];
        vc.subView = Views[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        ExamplesViewController *vc = [[ExamplesViewController alloc] init];
        
        if (indexPath.row == 4) {
            vc.isPDF = NO;
        }else
            vc.isPDF = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end








