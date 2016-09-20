//
//  FileUtils.m
//  ServiceEngineer
//
//  Created by Alex Sid on 28.12.15.
//  Copyright (c) 2015 UnitMobile. All rights reserved.
//

#import "FileUtils.h"
#include <sys/xattr.h>

@implementation FileUtils

+(NSMutableArray*)readPlist:(NSString*)fileName {
    NSMutableArray *plist = nil;
    NSString *path = [[self class] pathInDocumentDirectoryForFile:fileName];
    plist = [NSMutableArray arrayWithContentsOfFile:path];
    if(!plist) {
        // если в DocumentDirectory нет Playlist, то копируем его туда из Bundle
        path = [[self class] pathInBundleForFile:fileName];
        plist = [NSMutableArray arrayWithContentsOfFile:path];
        [[self class] writePlistWithContents:plist file:fileName];
    }
    return plist;
}

+(NSString*)pathInBundleForFile:(NSString*)fileName {
    return [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
}

+(NSString*)pathInDocumentDirectoryForFile:(NSString*)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

@end
