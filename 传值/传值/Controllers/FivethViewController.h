//
//  FivethViewController.h
//  传值
//
//  Created by wangjie on 2018/5/8.
//  Copyright © 2018年 I just want to be a quiet and handsome man. All rights reserved.
//

#import <UIKit/UIKit.h>

//1定义代理协议
@protocol FivethViewControllerDelegate <NSObject>
@optional
-(void)passValue:(NSString *)str;
@end

@interface FivethViewController : UIViewController
//2定义代理属性
@property (nonatomic, weak)id <FivethViewControllerDelegate> delegate;
@end
