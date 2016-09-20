//
//  FileUtils.h
//  ServiceEngineer
//
//  Created by Alex Sid on 28.12.15.
//  Copyright (c) 2015 UnitMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtils : NSObject

+(NSMutableArray*)readPlist:(NSString*)fileName;

@end
