//
//  DFHook.h
//  
//
//  Created by 全程恺 on 17/1/4.
//  Copyright © 2017年 xmisp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static void DFExchangeMethod(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getInstanceMethod(aClass, oldSEL);
    assert(oldMethod);
    Method newMethod = class_getInstanceMethod(aClass, newSEL);
    assert(newMethod);
    method_exchangeImplementations(oldMethod, newMethod);
}

@interface DFHook : NSObject

+ (NSString *)getEventIDFrom:(NSString *)target key:(NSString *)key;

@end
