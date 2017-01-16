//
//  UIControl+DFHook.m
//  
//
//  Created by 全程恺 on 17/1/4.
//  Copyright © 2017年 xmisp. All rights reserved.
//

#import "UIControl+DFHook.h"
#import "DFHook.h"

@implementation UIControl (DFHook)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL DFSelector = @selector(df_sendAction:to:forEvent:);
        DFExchangeMethod([self class], originalSelector, DFSelector);
    });
}

- (void)df_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    
    //插入埋点代码
    NSString *eventID = [DFHook getEventIDFrom:NSStringFromClass([target class]) key:NSStringFromSelector(action)];
    if (eventID.length) {
        
        NSLog(@"\nhook success \n  %@", eventID);
    }
    [self df_sendAction:action to:target forEvent:event];
}

@end
