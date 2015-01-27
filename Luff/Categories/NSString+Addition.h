//
//  NSString+Addition.h
//  Example
//
//  Created by booy on 14-9-9.
//  Copyright (c) 2014年 Luff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

- (BOOL)isEmail;
- (BOOL)isURL;
- (BOOL)isMobile;
- (BOOL)isTelephone;
- (BOOL)isChineseID;
- (NSString *)URLEncode;
- (NSString *)md5;
- (NSString *)sha1;

@end
