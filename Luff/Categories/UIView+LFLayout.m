//
//  UIView+LFLayout.m
//  Example
//
//  Created by booy on 14-9-3.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import "UIView+LFLayout.h"
#import <objc/runtime.h>

@implementation UIView (LFLayout)

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;

}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)screenX
{
    UIView* view = self;
    CGFloat x = view.x;
    while (view) {
        view = view.superview;
        x += view.x;
    }
    return x;
}

- (CGFloat)screenY
{
    UIView* view = self;
    CGFloat y = view.y;
    while (view) {
        view = view.superview;
        y += view.y;
    }
    return y;
}

- (CGFloat)screenViewX
{
    UIView* view = self;
    CGFloat x = view.x;
    while (view) {
        view = view.superview;
        x += view.x;
    
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    return x;
}

- (CGFloat)screenViewY
{
    UIView* view = self;
    CGFloat y = view.y;
    while (view) {
        view = view.superview;
        y += view.y;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (id)subviewOfTag:(NSInteger)tag
{
    for(UIView *view in [self subviews]){
        if(view.tag == tag){
            return view;
        }
    }
    return nil;
}
@end
