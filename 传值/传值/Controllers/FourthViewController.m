//
//  FourthViewController.m
//  传值
//
//  Created by wangjie on 2018/5/8.
//  Copyright © 2018年 I just want to be a quiet and handsome man. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *play = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 70, 20)];
    
    [play setBackgroundColor:[UIColor blueColor]];
    [play addTarget:self action:@selector(sendMusic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:play];
    
    
}

-(void)sendMusic{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"通知传值" forKey:@"music"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FM" object:nil userInfo:dict];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
