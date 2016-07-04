//
//  Ultils.m
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import "Ultils.h"

@interface Ultils() <SSZipArchiveDelegate>

@end

@implementation Ultils

+ (Ultils *)sharedInstance
{
    static Ultils *shared;
    static dispatch_once_t KAlertOnceToken;
    dispatch_once(&KAlertOnceToken, ^{
        shared = [[Ultils alloc] init];
        
    });
    return shared;
}


+ (NSString*)copyZipFile:(NSString*)zipFile
{
    NSString *localZip = [FilePath MangaCacheFilesZip];
    NSString *localFileZip = [NSString stringWithFormat:@"%@/%@",localZip,zipFile];
    
    
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *fileURL = [bundle URLForResource:FILENAME withExtension:@"zip"];
//    NSString *filePath = [fileURL absoluteString];
    
    
    NSString *filePath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"MachiShojo.zip"];

    
    [FilePath copyAllFileFromPath:filePath toPath:localFileZip];
    
    return localFileZip;
    
}

+ (void)readFileFromZip
{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *fileURL = [bundle URLForResource:FILENAME withExtension:@"zip"];
//    
//    NSString *filePath = [fileURL absoluteString];
    
     NSString *temp = [Ultils copyZipFile:FILENAME];
    
    NSString *extraPath = [FilePath MangaCacheFileForFolder:FILENAME];
    BOOL success = [SSZipArchive unzipFileAtPath:temp toDestination:extraPath delegate:[Ultils sharedInstance]];

    if (success) {
        NSLog(@"unzip thanh cong");
    }
}

+ (NSArray *)arrImageFromPath:(NSString *)filePath
{
    NSMutableArray *arr = [NSMutableArray new];
    
    NSArray *listFile = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:nil];
    listFile = [listFile sortedArrayUsingSelector:@selector(compareNumberStrings:)];
    
    for (NSString *item in listFile) {
        if ([item hasSuffix:@".png"]) {
            @autoreleasepool {
                NSString *shortname = [item stringByDeletingPathExtension];
                if ([shortname isAllDigits]) {
                    NSString *fileFullPath = [filePath stringByAppendingPathComponent:item];
                    NSData *data = [NSData dataWithContentsOfFile:fileFullPath];
                    UIImage *image = [UIImage imageWithData:data];
                    if (image) {
                        [arr addObject:image];
                    }
                }
            }
        }
    }
    
    return arr;
}

#pragma mark SSZipArchiveDelegate

- (void)zipArchiveDidUnzipArchiveAtPath:(NSString *)path zipInfo:(unz_global_info)zipInfo unzippedPath:(NSString *)unzippedPath
{
//    DownloadRequestContext *context = [_pathZipMap objectForKey:unzippedPath];
//    [self updateStatus:STATUS_DONE andState:StickerDownloaded forContext:context];
    
    
}


@end
