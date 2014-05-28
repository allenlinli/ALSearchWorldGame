//
//  ALPoint.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALWorldStruct.h"

typedef enum {
    ALPointRoadStateRoad,
    ALPointRoadStateWall,
    ALPointRoadStateStart,
    ALPointRoadStateEnd,
    ALPointRoadStateTotalCount
}ALPointRoadState;

typedef enum {
    ALPointSearchStateWalked,
    ALPointSearchStateNew,
    ALPointSearchStateTotalCount
}ALPointSearchState;

@interface ALPoint : NSObject
@property (assign, nonatomic) ALPointRoadState roadState;
@property (assign, nonatomic) ALPointSearchState searchState;
@property (assign, nonatomic) ALCoordiante coor;

-(id)initWithCoor:(ALCoordiante)coor;
-(id)initWithRandomRoadStateOfPointAtCoor:(ALCoordiante)coor;
-(id)initWithCoor:(ALCoordiante)coor state:(ALPointRoadState)state;
-(id)initWithCoordinateX:(NSInteger)coordinateX coordinateY:(NSInteger)coordinateY state:(ALPointRoadState)state;

@end
