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

-(ALPath *)exploreShortestPathWithMap:(ALMap *)map{
    NSMutableArray *pathsQueue = [[self class] newPathsQueueWithMap:map];
    
    while (!pathsQueue && pathsQueue.count) {
        //拿出一個path
        ALPath *choosedPath = [self popFromPathsQueue:pathsQueue];

        if(!choosedPath) return nil;
        //找尋可以走的點
        NSArray *exploredPoints = [self exploreRoadPointsWithPath:choosedPath map:map];
        
        //判斷是否是終點
        //判斷是否走過
        //把沒走過的點做成path，加進pathsQueue
        for (ALPoint *newPoint in exploredPoints) {
            switch (newPoint.roadState) {
                    
                case ALPointRoadStateEnd:{
                    [choosedPath pushWithCoordinate:newPoint.coor];
                    return choosedPath;
                }
                    break;
                    
                case ALPointRoadStateRoad:{
                    if (newPoint.searchState == ALPointSearchStateNew) {
                        [map changePointAtCoor:newPoint.coor withSearchState:ALPointSearchStateWalked];
                        [choosedPath pushWithCoordinate:newPoint.coor];
                        [self pushToPathsQueue:pathsQueue with:choosedPath];
                    }
                    
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


+(NSMutableArray *)newPathsQueueWithMap:(ALMap *)map{
    NSMutableArray *localPathsQueue = [[NSMutableArray alloc]init];
    
    ALPath *path = [[ALPath alloc]init];
    [path pushWithCoordinate:map.startPoint.coor];
    [localPathsQueue addObject:localPathsQueue];
    
    return localPathsQueue;
}

-(NSArray *)exploreRoadPointsWithPath:(ALPath *)path map:(ALMap *)map{
    ALCoordiante coor = path.headPointCoordinate;
    
    NSMutableArray *roadPoints = [[NSMutableArray alloc]init];
    for (NSInteger i = -1; i<=1; i=i+2) {
        ALPoint *point = [map pointAtCoor:ALCoordianteMake(coor.x+i, coor.y)];
        if (point.roadState == ALPointRoadStateRoad || point.roadState == ALPointRoadStateEnd) {
            [roadPoints addObject:point];
        }
    }
    
    for (NSInteger i = -1; i<=1; i=i+2) {
        ALPoint *point = [map pointAtCoor:ALCoordianteMake(coor.x, coor.y+i)];
        if (point.roadState == ALPointRoadStateRoad || point.roadState == ALPointRoadStateEnd) {
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

-(void)pushToPathsQueue:(NSMutableArray *)pathsQueue with:(ALPath *)path{
    [pathsQueue addObject:path];
}


@end


