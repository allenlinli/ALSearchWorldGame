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
    return [self initWithCoor:coor state:ALPointStateWall];
}

-(id)initWithRandomStateWithCoor:(ALCoordiante)coor{
    ALPointState state = arc4random() % ALPointStateTotalCount;
    return [self initWithCoor:coor state:state];
}

-(id)initWithCoor:(ALCoordiante)coor state:(ALPointState)state{
    self = [super init];
    
    if (self) {
        _coor = coor;
        _state = state;
    }
    
    return self;
}

-(id)initWithCoordinateX:(NSInteger)coordinateX coordinateY:(NSInteger)coordinateY state:(ALPointState)state{
    ALCoordiante coor = ALCoordianteMake(coordinateX, coordinateY);
    return [self initWithCoor:coor state:state];
}
@end
