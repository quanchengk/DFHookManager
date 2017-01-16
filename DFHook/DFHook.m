//
//  DFHook.m
//  
//
//  Created by 全程恺 on 17/1/4.
//  Copyright © 2017年 xmisp. All rights reserved.
//

#import "DFHook.h"

@implementation DFHook

+ (NSString *)getEventIDFrom:(NSString *)target key:(NSString *)key {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DFHookConfig" ofType:@"plist"];
    NSDictionary *configDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSString *eventID = configDic[target][key];
    return eventID ? eventID : @"";
}

@end
