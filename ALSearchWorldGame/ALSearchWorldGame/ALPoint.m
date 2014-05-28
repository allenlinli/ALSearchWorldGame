//
//  ALPoint.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPoint.h"

@implementation ALPoint

-(id)initWithCoor:(ALCoordiante)coor{
    return [self initWithCoor:coor state:ALPointRoadStateWall];
}

-(id)initWithRandomRoadStateOfPointAtCoor:(ALCoordiante)coor{
    ALPointRoadState state = arc4random() % ALPointRoadStateTotalCount;
    return [self initWithCoor:coor state:state];
}

-(id)initWithCoor:(ALCoordiante)coor state:(ALPointRoadState)state{
    self = [super init];
    
    if (self) {
        _coor.x = coor.x;
        _coor.y = coor.y;
        _roadState = state;
    }
    
    return self;
}

-(id)initWithCoordinateX:(NSInteger)coordinateX coordinateY:(NSInteger)coordinateY state:(ALPointRoadState)state{
    ALCoordiante coor = ALCoordianteMake(coordinateX, coordinateY);
    return [self initWithCoor:coor state:state];
}

@end
