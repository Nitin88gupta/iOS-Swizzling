//
//  NSObject+AddOn.m
//  iOSSwizzlingSample
//
//  Created by Nitin Gupta on 6/2/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NSObject+AddOn.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (AddOn)

+(void) load {
    [self swizzleSel:@selector(description) newMethod:@selector(descriptionTest)];
}

-(void) swizzleSel:(SEL)origMethod newMethod:(SEL)newSelector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], origMethod);
        Method newMethod = class_getInstanceMethod([self class], newSelector);
        
        BOOL methodAdded = class_addMethod([self class],
                                           origMethod,
                                           method_getImplementation(newMethod),
                                           method_getTypeEncoding(newMethod));
        
        if (methodAdded) {
            class_replaceMethod([self class],
                                newSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, newMethod);
        }
    });
}

-(NSString *)descriptionTest {
    return [NSString stringWithFormat:@"Swizzling Test Description Method:%s Class:%@,Pointer:%p,Line: %d",__FUNCTION__,NSStringFromClass([self class]),self,__LINE__];
}

@end
