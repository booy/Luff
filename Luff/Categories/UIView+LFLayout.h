//
//  UIView+LFLayout.h
//  Example
//
//  Created by booy on 14-9-3.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LFLayout)

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic, readonly) CGFloat screenX;
@property (nonatomic, readonly) CGFloat screenY;
@property (nonatomic, readonly) CGFloat screenViewX;
@property (nonatomic, readonly) CGFloat screenViewY;

- (id)subviewOfTag:(NSInteger)tag;

@end
