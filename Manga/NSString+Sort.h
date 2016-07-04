//
//  NSString+Sort.h
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sort)

-(NSComparisonResult)compareNumberStrings:(NSString *)str;
- (BOOL)isAllDigits;

@end
