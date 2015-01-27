//
//  UIScrollView+LFPullToRefresh.h
//  Example
//
//  Created by booy on 14-9-4.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LFPullToRefreshState) {
    LFPullToRefreshStateNormal = 0,
    LFPullToRefreshStateTriggered = 1,
    LFPullToRefreshStateLoading = 2
};

typedef void (^TriggerHandler)();
typedef void (^PullingHandle)(CGFloat triPercent);


@interface LFPullToRefreshView : UIView

@property(nonatomic, readonly) LFPullToRefreshState state;
@property(nonatomic, strong)PullingHandle pullingHandler;
@property(nonatomic) float trigLength;

- (UIView *)viewForState:(LFPullToRefreshState)state;

@end

@interface UIScrollView (LFPullToRefresh)

@property(nonatomic, strong)LFPullToRefreshView *pullToRefreshView;

@property(nonatomic) BOOL showsPullToRefresh;

- (void)addPullToRefreshWithActionHandler:(TriggerHandler)handler;

@end
