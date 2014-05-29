//
//  ALPrinter.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPrinter.h"
#import "ALPath.h"
#import "NSValue+ALCoordinate.h"


@implementation ALPrinter



+(void)printPathsQueue:(NSMutableArray *)pathsQueue
{
    NSLog(@"Print PathsQueue");
    for (ALPath *path in pathsQueue) {
        NSLog(@"path:%@   head:(%i,%i)",path,path.headPointCoordinate.x,path.headPointCoordinate.y);
        [self printPath:path];
    }
}

+(void)printPath:(ALPath *)path
{
    NSLog(@"Print a Path");
    for (NSValue *value in path.coordinateStack) {
        ALCoordiante coor = [value coordinate];
        NSLog(@"coor:(%i,%i)",coor.x,coor.y);
    }
}

+(void)printALCoordiante:(ALCoordiante)coor
{
    NSLog(@"printALCoordiante");
    NSLog(@"coor:(%i,%i)",coor.x,coor.y);
}
@end
