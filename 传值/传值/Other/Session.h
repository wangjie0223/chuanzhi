//
//  Session.h
//  传值
//
//  Created by wangjie on 2018/5/8.
//  Copyright © 2018年 I just want to be a quiet and handsome man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject
@property (nonatomic, copy) NSString *name;
+(instancetype)sharedName;
@end
