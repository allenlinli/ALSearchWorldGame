//
//  ALWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALWorld.h"


const NSUInteger ALWorldInitialWidth = 100;
const NSUInteger ALWorldInitialHeight = 100;

@implementation ALWorld
-(id)initWorld{
    self = [super init];
    if (self) {
        self = [self initWorldWithSize:ALWorldSizeMake(ALWorldInitialWidth, ALWorldInitialHeight)];
    }
    return self;
}
-(id)initWorldWithSize:(ALWorldSize)worldSize{
    if (worldSize.width <=0 || worldSize.height<=0) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _width = worldSize.width;
        _height = worldSize.height;
        
        NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:worldSize.height];
        for (NSUInteger row = 0; row < worldSize.height; row++) {
            NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:worldSize.width];
            for (NSUInteger column = 0 ; column < worldSize.width; column++) {
                ALCoordiante coor = ALCoordianteMake(row, column);
                ALPoint *point = [[ALPoint alloc] initWithRandomStateWithCoor:coor];
                [rowArray addObject:point];
            }
            [twoDArray addObject:rowArray];
        }
    }
    
    NSUInteger randomStartPointCoorX = arc4random() % self.width;
    NSUInteger randomStartPointCoorY = arc4random() % self.height;
    _startPoint = [[ALPoint alloc] initWithCoordinateX:randomStartPointCoorX coordinateY:randomStartPointCoorY state:ALPointStateRoad];
    
    NSUInteger randomEndPointCoorX = arc4random() % self.width;
    NSUInteger randomEndPointCoorY = arc4random() % self.height;
    _endPoint = [[ALPoint alloc] initWithCoordinateX:randomEndPointCoorX coordinateY:randomEndPointCoorY state:ALPointStateRoad];
    
    return self;
}

-(ALPoint const *) pointWithCoor:(ALCoordiante) coor {
    if (coor.coordianteX > self.width || coor.coordianteY > self.height) {
        NSLog(@"[BUG]");
        return 0;
    }
    
    NSArray *rowArray = self.twoDPoints[coor.coordianteY];
    ALPoint *point = rowArray[coor.coordianteX];
    return point;
}

-(void)changePointState:(ALPointState)state withCoor:(ALCoordiante)coor{
    NSMutableArray *rowArray = self.twoDPoints[coor.coordianteY];
    ALPoint *point = rowArray[coor.coordianteX];
    point.state = state;
    rowArray[coor.coordianteX] = point;
//    [rowArray replaceObjectAtIndex:coor.coordianteX withObject:point];
}

@end
