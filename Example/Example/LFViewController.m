//
//  LFViewController.m
//  Example
//
//  Created by booy on 14-9-3.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import "LFViewController.h"
#import "UIView+LFLayout.h"
#import "UIScrollView+LFPullToRefresh.h"

@interface LFViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label_text;
@property (strong, nonatomic) IBOutlet UIView *block;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@end

@implementation LFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scroll.scrollEnabled = YES;
    self.scroll.contentSize = CGSizeMake(640, 1200);
    
    
    [self.scroll addPullToRefreshWithActionHandler:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
