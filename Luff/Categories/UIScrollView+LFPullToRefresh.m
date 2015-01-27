//
//  UIScrollView+LFPullToRefresh.m
//  Example
//
//  Created by booy on 14-9-4.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import "UIScrollView+LFPullToRefresh.h"
#import <objc/runtime.h>

static CGFloat const LFPullToRefreshViewHeight = 60;

@interface LFPullToRefreshView ()

@property(nonatomic) BOOL isObserving;

@end

@implementation LFPullToRefreshView

NSString *const kPathRefreshState = @"kPathRefreshState";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.trigLength = 60.f;
    
    [self addObserver:self forKeyPath:kPathRefreshState options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

- (void)setState:(LFPullToRefreshState)state
{
    if (_state != state) {
        [self willChangeValueForKey:@""];
        _state = state;
    }
}

- (NSString *)stateStringOfState:(LFPullToRefreshState)state
{
    return @[@"下拉刷新", @"释放更新", @"正在加载"][state];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@-%@",keyPath ,change);
}

- (void)didScollWithContentOffset:()

@end

@implementation UIScrollView (LFPullToRefresh)

static void *LFPullToRefreshViewPropertyKey = &LFPullToRefreshViewPropertyKey;

- (LFPullToRefreshView *)pullToRefreshView
{
    return objc_getAssociatedObject(self, LFPullToRefreshViewPropertyKey);
}

- (void)setPullToRefreshView:(LFPullToRefreshView *)pullToRefreshView
{
    objc_setAssociatedObject(self, LFPullToRefreshViewPropertyKey, pullToRefreshView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)showsPullToRefresh
{
    return !self.pullToRefreshView.hidden;
}

- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh
{
    self.pullToRefreshView.hidden = !showsPullToRefresh;
    
    if (!showsPullToRefresh) {
        if (self.pullToRefreshView.isObserving) {
            [self removeObserver:self.pullToRefreshView forKeyPath:@"contentOffset"];
            self.pullToRefreshView.isObserving = NO;
        }
    }else{
        if (!self.pullToRefreshView.isObserving) {
            [self addObserver:self.pullToRefreshView forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
            self.pullToRefreshView.isObserving = YES;
        }
    }
}

- (void)addPullToRefreshWithActionHandler:(TriggerHandler)handler
{
    if (!self.pullToRefreshView) {
        self.pullToRefreshView = [LFPullToRefreshView new];
        
        if (!self.trigLength) {
            self.trigLength = 60.f;
        }
        
        self.pullToRefreshView.frame = CGRectMake(0, - self.trigLength, self.frame.size.width, self.trigLength);
    }
    
    [self addSubview:self.pullToRefreshView];
    self.showsPullToRefresh = YES;
}

@end
