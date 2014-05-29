//
//  ALPathExplorer.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/28/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPathExplorer.h"
#import "ALPath.h"

@interface ALPathExplorer ()
@property (strong, nonatomic) ALMap *map;
@property (strong, nonatomic) NSMutableArray *pathsQueue; //包含很多個path的queue
@end

@implementation ALPathExplorer

-(ALPath *)exploreShortestPathWithMap:(ALMap *)map{
    self.map = map;
    self.pathsQueue = [[self class] newPathsQueueWithMap:map];
    
    //拿出一個path
    
    //找尋可以走、且未走過的新點
    
    //把新點的path加入queue
    
    //更新地圖
    
    return nil;
}


+(NSMutableArray *)newPathsQueueWithMap:(ALMap *)map{
    NSMutableArray *localPathsQueue = [[NSMutableArray alloc]init];
    
    ALPath *path = [[ALPath alloc]init];
    [path pushWithCoordinate:map.startPoint.coor];
    [localPathsQueue addObject:localPathsQueue];
    
    return localPathsQueue;
}

-(void)exploreOnePath{

    ALPath *choosedPath = [self popFromPathsQueue];
    [self explorePath:choosedPath withMap:self.map];
    
}

-(void)explorePath:(ALPath *)choosedPath withMap:(ALMap *)map{
    
    while (!choosedPath) {
        NSArray *exploredPoints = [self exploredPointsWithPath:choosedPath map:map];
        for (ALPoint *newPoint in exploredPoints) {
            switch (newPoint.roadState) {
                    
                case ALPointRoadStateEnd:{
                    [choosedPath pushWithCoordinate:newPoint.coor];
//                    _shortestPath = choosedPath;
                    return;
                }
                    break;
                    
                case ALPointRoadStateRoad:{
                    if (newPoint.searchState == ALPointSearchStateNew) {
                        [self.map changePointAtCoor:newPoint.coor withSearchState:ALPointSearchStateWalked];
                        ALPath *newPath = [choosedPath copy];
                        [newPath pushWithCoordinate:newPoint.coor];
                        [self pushToPathsQueueWith:newPath];
                    }
                    
                }
                    break;
                    
                default:
                    NSAssert(NO, @"");
                    break;
            }
        }
    }
    
}

-(NSArray *)exploredPointsWithPath:(ALPath *)path map:(ALMap *)map{
    ALCoordiante coor = path.headPointCoordinate;
    
    
    NSMutableArray *roadPoints = [[NSMutableArray alloc]init];
    for (NSInteger i = -1; i<=1; i=i+2) {
        ALPoint *point = [self.map pointAtCoor:ALCoordianteMake(coor.x+i, coor.y)];
        if (point.roadState == ALPointRoadStateRoad || point.roadState == ALPointRoadStateEnd) {
            [roadPoints addObject:point];
        }
    }
    
    for (NSInteger i = -1; i<=1; i=i+2) {
        ALPoint *point = [self.map pointAtCoor:ALCoordianteMake(coor.x, coor.y+i)];
        if (point.roadState == ALPointRoadStateRoad || point.roadState == ALPointRoadStateEnd) {
            [roadPoints addObject:point];
        }
    }
    
    
    return [roadPoints copy];
}

//-(BOOL)isPointAEndPoint:(ALPoint *)point{
//    return [ALPoint isCoordinateEqualWithPoint:point withAnotherPoint:self.map.endPoint];
//}

-(ALPath *)popFromPathsQueue{
    if (!self.pathsQueue) {
        return nil;
    }
    
    return [self.pathsQueue firstObject];
}

-(void)pushToPathsQueueWith:(ALPath *)path{
    [_pathsQueue addObject:path];
}


@end


