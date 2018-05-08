//
//  ViewController.m
//  传值
//
//  Created by wangjie on 2018/5/8.
//  Copyright © 2018年 I just want to be a quiet and handsome man. All rights reserved.
//

#import "ViewController.h"
#import "Session.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FivethViewController.h"
#import "SixthViewController.h"
#import <Masonry.h>
@interface ViewController ()<FivethViewControllerDelegate>

@property (nonatomic,strong)UILabel * label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [[UIButton alloc]init];
    [self.view addSubview:btn1];
    
    //属性传值
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    [btn1 setTitle:@"属性传值" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(nextVc) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    
    
    //单例传值
    UIButton *btn2 = [[UIButton alloc]init];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn1.mas_centerX);
        make.width.height.equalTo(btn1);
        make.top.equalTo(btn1.mas_bottom).offset(20);
    }];
    [btn2 setTitle:@"单例传值" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(nextVc2) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor blueColor]];
    
    //通知传值
    UIButton *btn3 = [[UIButton alloc]init];
    [self.view addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn1.mas_centerX);
        make.width.height.equalTo(btn1);
        make.top.equalTo(btn2.mas_bottom).offset(20);
    }];
    [btn3 setTitle:@"通知传值" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(nextVc3) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor blueColor]];
    
    //注册通知
    //可以理解为创建一个收音机，调到FM电台，等待接收广播信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listen:) name:@"FM" object:nil];
    
    
    //代理传值
    UIButton *btn4 = [[UIButton alloc]init];
    [self.view addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn1.mas_centerX);
        make.width.height.equalTo(btn1);
        make.top.equalTo(btn3.mas_bottom).offset(20);
    }];
    [btn4 setTitle:@"代理传值" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(nextVc4) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor blueColor]];
    
    //block传值
    UIButton *btn5 = [[UIButton alloc]init];
    [self.view addSubview:btn5];
    [btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn1.mas_centerX);
        make.width.height.equalTo(btn1);
        make.top.equalTo(btn4.mas_bottom).offset(20);
    }];
    [btn5 setTitle:@"block传值" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(nextVc5) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setBackgroundColor:[UIColor blueColor]];
}


#pragma mark - block传值
- (void)nextVc5 {
    SixthViewController *vc = [[SixthViewController alloc]init];
    __block typeof (self)tempSelf = self;
    vc.blockFun = ^(NSString *string){
        //tempSelf.lab.text = string;
        tempSelf.title = string;
        //self.label
        NSLog(@"%@",string);
    };
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 代理传值
- (void)nextVc4 {
    FivethViewController *vc = [[FivethViewController alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark 实现代理方法
-(void)passValue:(NSString *)str{
    NSLog(@"%@",str);
    self.title = str;
}



-(void)listen:(NSNotification *)sender{
    NSLog(@"您正在收听的是：%@",sender.userInfo[@"music"]);
    self.title = sender.userInfo[@"music"];
}

- (void)nextVc3 {
    FourthViewController *vc = [[FourthViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)nextVc2 {
    ThirdViewController *vc = [[ThirdViewController alloc]init];
    Session *s = [Session sharedName];
    s.name = @"单例传值";
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 属性传值
- (void)nextVc {
    SecondViewController *vc = [[SecondViewController alloc]init];
    vc.name =@"属性传值";
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
