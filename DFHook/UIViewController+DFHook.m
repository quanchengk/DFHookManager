//
//  UIViewController+DFHook.m
//  
//
//  Created by 全程恺 on 17/1/4.
//  Copyright © 2017年 xmisp. All rights reserved.
//

#import "UIViewController+DFHook.h"

@implementation UIViewController (DFHook)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //页面加载埋点
        SEL originalInSelector = @selector(viewDidLoad);
        SEL DFInSelector = @selector(df_viewDidLoad);
        DFExchangeMethod([self class], originalInSelector, DFInSelector);
        
        //页面消失埋点
        SEL originalOutSelector = @selector(viewDidDisappear:);
        SEL DFOutSelector = @selector(df_viewDidDisappear:);
        DFExchangeMethod([self class], originalOutSelector, DFOutSelector);
    });
}

- (void)df_viewDidLoad {
    
    NSString *eventID = [DFHook getEventIDFrom:NSStringFromClass([self class]) key:@"in"];
    if (eventID.length) {
        
        NSLog(@"\nhook success \n %@", eventID);
    }
    [self df_viewDidLoad];
}

- (void)df_viewDidDisappear:(BOOL)animated {
    
    NSString *eventID = [DFHook getEventIDFrom:NSStringFromClass([self class]) key:@"out"];
    if (eventID.length) {
        
        NSLog(@"\nhook success \n  %@", eventID);
    }
    [self df_viewDidDisappear:animated];
}

@end
