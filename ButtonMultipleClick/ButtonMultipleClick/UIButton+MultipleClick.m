//
//  UIButton+MultipleClick.m
//  ButtonMultipleClick
//
//  Created by 陈阳阳 on 16/9/1.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "UIButton+MultipleClick.h"
#import <objc/message.h>

@implementation UIButton (MultipleClick)

static const char *eventInterval = "eventInterval";

static const char *lastTimePoint   = "lastTime";

@dynamic timeInterval,lastTime;

+ (void)load {
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(multipleClickSendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)multipleClickSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {

    BOOL isCarryOut = (NSDate.date.timeIntervalSince1970 - self.lastTime >= self.timeInterval);
    if (self.timeInterval > 0) {
        self.lastTime = NSDate.date.timeIntervalSince1970;
    }
    if (isCarryOut) {
        [self multipleClickSendAction:action to:target forEvent:event];
    }
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    objc_setAssociatedObject(self, eventInterval, @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, eventInterval) doubleValue];
}

- (void)setLastTime:(NSTimeInterval)lastTime {
    objc_setAssociatedObject(self, lastTimePoint, @(lastTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)lastTime {
    return [objc_getAssociatedObject(self, lastTimePoint) doubleValue];

}

@end
