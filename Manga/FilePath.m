//
//  FilePath.m
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import "FilePath.h"

static NSString *rootPathString = nil;


@implementation FilePath



+ (NSString *)MangaCacheFileForFolder:(NSString*)folderName
{
    NSString *gntStickerPath = [NSString stringWithFormat:@"%@/%@", [FilePath MangaCacheFiles],  folderName];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:gntStickerPath]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:gntStickerPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return gntStickerPath;
}


+ (NSString*)MangaCacheFiles{
    
    NSString *pathFile =  [FilePath createDirectoryWithName:@"Manga"];
    return pathFile;
}

+ (NSString*)MangaCacheFilesZip{
    
    NSString *pathFile =  [FilePath createDirectoryWithName:@"MangaZip"];
    return pathFile;
}

+ (NSString*)rootPath{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(rootPathString == nil){
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            rootPathString = [paths objectAtIndex:0];
            
        }
    });
    
    
    return rootPathString;
}

+ (NSString*)createDirectoryWithName:(NSString*)name
{
    
    NSFileManager *fileManager= [NSFileManager defaultManager];
    
    NSString *path = [[FilePath rootPath] stringByAppendingPathComponent:name];
    
    if(![fileManager fileExistsAtPath:path]){
        
        NSError *error = nil;
        if(![fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"Error when create \" %@ \" directory", name);
            
        }
    }
    
    return path;
}

+ (BOOL)copyAllFileFromPath:(NSString *)source toPath:(NSString *)destination
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:destination]) {
        [fileManager removeItemAtPath:destination error:nil];
    }
    return [[NSFileManager defaultManager] copyItemAtPath:source toPath:destination error:nil];
}


@end
