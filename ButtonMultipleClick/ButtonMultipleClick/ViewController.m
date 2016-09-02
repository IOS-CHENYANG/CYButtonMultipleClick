//
//  ViewController.m
//  ButtonMultipleClick
//
//  Created by 陈阳阳 on 16/9/1.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+MultipleClick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 80, 40)];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    button.timeInterval = 0.5;
    [self.view addSubview:button];
}

- (void)btnClick {
    NSLog(@"点击了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
