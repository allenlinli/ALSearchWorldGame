//
//  ALPathExplorer.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/28/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPathExplorer.h"
#import "ALPath.h"
#import "ALMap.h"

@interface ALPathExplorer ()
@end

@implementation ALPathExplorer

-(ALPath *)exploreShortestPathWithMap:(ALMap *)map
{
    NSMutableArray *pathsQueue = [[self class] newPathsQueueWithMap:map];
    map.startPoint.searchState = ALPointSearchStateWalked;
    
    NSUInteger loopCount = 0;
    while (pathsQueue.count) {
        
        //Printer
//        NSLog(@"L O O P :%i",loopCount);
//        loopCount++;
//        for (ALPath *path in pathsQueue) {
//            [ALPrinterClass printPath:path];
//        }
        
        //拿出一個path
        ALPath *choosedPath = [self popFromPathsQueue:pathsQueue];
        
        if(!choosedPath) return nil;
        //找尋可以走的點
        NSArray *exploredPoints = [self exploreNewRoadPointsWithPath:choosedPath map:map];
        
        //判斷是否是終點
        //判斷是否走過
        //把沒走過的點做成path，加進pathsQueue
        for (ALPoint *newPoint in exploredPoints) {
            
//            NSLog(@"newPoint:%@   (%i,%i)  %i %i",newPoint,newPoint.coor.x,newPoint.coor.y,newPoint.roadState,newPoint.searchState);
            
            switch (newPoint.roadState) {
                case ALPointRoadStateEnd:{
                    newPoint.searchState = ALPointSearchStateWalked;
                    ALPath *addedPointPath = [choosedPath copy];
                    [addedPointPath pushWithCoordinate:newPoint.coor];
                    return addedPointPath;
                }
                    break;
                    
                case ALPointRoadStateRoad:{
                    newPoint.searchState = ALPointSearchStateWalked;
                    ALPath *addedPointPath = [choosedPath copy];
                    [addedPointPath pushWithCoordinate:newPoint.coor];
                    [self pushToPathsQueue:pathsQueue with:addedPointPath];
                }
                    break;
                    
                default:
                    NSAssert(NO, @"");
                    break;
            }
        }
    }
    
    
    return nil;
}


+(NSMutableArray *)newPathsQueueWithMap:(ALMap *)map
{
    NSMutableArray *localPathsQueue = [[NSMutableArray alloc]init];
    
    ALPath *path = [[ALPath alloc]init];
    [path pushWithCoordinate:map.startPoint.coor];
    [localPathsQueue addObject:path];
    
    return localPathsQueue;
}

-(NSArray *)exploreNewRoadPointsWithPath:(ALPath *)path map:(ALMap *)map{
    ALCoordiante coor = path.headPointCoordinate;
    
    NSMutableArray *roadPoints = [[NSMutableArray alloc] init];
    NSArray *shifts = @[@[@1, @0], @[@(-1), @0],@[@0, @1], @[@0, @(-1)]];
    for (NSArray *a in shifts) {
        NSInteger shiftX = coor.x + [a[0] intValue];
        NSInteger shiftY = coor.y + [a[1] intValue];
        if (shiftX < 0 || shiftX >= map.size.width) {
            continue;
        }
        if (shiftY < 0 || shiftY >= map.size.height) {
            continue;
            }
        ALPoint *point = [map pointAtCoor:ALCoordianteMake(shiftX, shiftY)];
        if ((point.roadState == ALPointRoadStateRoad || point.roadState == ALPointRoadStateEnd)
            && point.searchState == ALPointSearchStateNew) {
            [roadPoints addObject:point];
        }
    }
    
    
    return [roadPoints copy];
}

-(ALPath *)popFromPathsQueue:(NSMutableArray *)pathsQueue
{
    if (!pathsQueue) {
        return nil;
    }
    
    ALPath *firstPath = pathsQueue[0];
    [pathsQueue removeObjectAtIndex:0];
    return firstPath;
}

-(void)pushToPathsQueue:(NSMutableArray *)pathsQueue with:(ALPath *)path
{
    [pathsQueue addObject:path];
}


@end


