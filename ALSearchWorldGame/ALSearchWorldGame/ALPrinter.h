//
//  ALPrinter.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALWorldStruct.h"
#define ALPrinterClass [ALPrinter class]

@class ALPath;

@interface ALPrinter : NSObject
+(void)printPathsQueue:(NSMutableArray *)pathsQueue;
+(void)printPath:(ALPath *)path;
+(void)printALCoordiante:(ALCoordiante)coor;
@end
