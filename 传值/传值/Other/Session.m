//
//  Session.m
//  传值
//
//  Created by wangjie on 2018/5/8.
//  Copyright © 2018年 I just want to be a quiet and handsome man. All rights reserved.
//

#import "Session.h"
static Session *sessionHandle = nil;

@implementation Session
+(instancetype)sharedName{
    if (sessionHandle == nil) {
        sessionHandle = [[Session alloc]init];
    }
    return sessionHandle;
}
@end
