//
//  FilePath.h
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilePath : NSObject

+ (NSString*)createDirectoryWithName:(NSString*)name;
+ (NSString *)MangaCacheFileForFolder:(NSString*)folderName;
+ (NSString*)MangaCacheFilesZip;
+ (BOOL)copyAllFileFromPath:(NSString *)source toPath:(NSString *)destination;

@end
