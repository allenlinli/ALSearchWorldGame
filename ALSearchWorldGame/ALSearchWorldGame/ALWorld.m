//
//  ALWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALWorld.h"


const NSUInteger ALWorldInitialWidth = 20;
const NSUInteger ALWorldInitialHeight = 40;

@implementation ALWorld
-(id)initWorldWithDefaultSize{
    self = [super init];
    if (self) {
        self = [self initWorldWithSize:ALWorldSizeMake(ALWorldInitialWidth, ALWorldInitialHeight)];
    }
    return self;
}
-(id)initWorldWithSize:(ALWorldSize)worldSize{
    if (worldSize.width <=0 || worldSize.height<=0) {
        NSLog(@"[BUG]");
        return nil;
    }
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _size = worldSize;
    
    NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:worldSize.height];
    for (NSUInteger row = 0; row < worldSize.height; row++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:worldSize.width];
        for (NSUInteger column = 0 ; column < worldSize.width; column++) {
            ALCoordiante coor = ALCoordianteMake(row, column);
            ALPoint *point = [[ALPoint alloc] initWithRandomRoadStateOfPointAtCoor:coor];
            [rowArray addObject:point];
        }
        [twoDArray addObject:rowArray];
    }
    
    _twoDPoints = twoDArray;
    
    
    //產生隨機的起點和中點，兩個點不能一樣
    NSUInteger randomStartPointCoorX = arc4random() % self.size.width;
    NSUInteger randomStartPointCoorY = arc4random() % self.size.height;
    _startPoint = [[ALPoint alloc] initWithCoordinateX:randomStartPointCoorX coordinateY:randomStartPointCoorY state:ALPointRoadStateRoad];
    
    do {
        NSUInteger randomEndPointCoorX = arc4random() % self.size.width;
        NSUInteger randomEndPointCoorY = arc4random() % self.size.height;
        _endPoint = [[ALPoint alloc] initWithCoordinateX:randomEndPointCoorX coordinateY:randomEndPointCoorY state:ALPointRoadStateRoad];
    } while (_endPoint.coor.x == _startPoint.coor.x && _endPoint.coor.y == _startPoint.coor.y);
    
    
    
    
    return self;
}

-(ALPoint const *) pointAtCoor:(ALCoordiante) coor {
    if (coor.x >= self.size.width || coor.y >= self.size.height) {
        NSLog(@"[BUG]");
        return 0;
    }
    
    NSArray *rowArray = self.twoDPoints[coor.y];
    ALPoint *point = rowArray[coor.x];
    return point;
}

-(void)changePointAtCoor:(ALCoordiante)coor withSearchState:(ALPointSearchState)searchState{
    NSMutableArray *rowArray = self.twoDPoints[coor.y];
    ALPoint *point = rowArray[coor.x];
    point.searchState = searchState;
    rowArray[coor.x] = point;
//    [rowArray replaceObjectAtIndex:coor.coordianteX withObject:point];
}

@end
