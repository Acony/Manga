//
//  Ultils.h
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SSZipArchive.h"
#import "FilePath.h"
#import "NSString+Sort.h"

#define FILENAME        @"MachiShojo"

@interface Ultils : NSObject

+ (void)readFileFromZip;
+ (NSArray*)arrImageFromPath:(NSString*)filePath;

@end
