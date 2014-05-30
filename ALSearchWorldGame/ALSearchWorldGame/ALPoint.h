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
    ALPointSearchStateNew,
    ALPointSearchStateWalked,
    ALPointSearchStateTotalCount
}ALPointSearchState;

@interface ALPoint : NSObject
@property (assign, nonatomic) ALPointRoadState roadState;
@property (assign, nonatomic) ALPointSearchState searchState;
@property (assign, nonatomic) ALCoordiante coor;

+(BOOL)isCoordinateEqualWithPoint:(ALPoint *)pointA withAnotherPoint:(ALPoint *)pointB;

-(id)initWithCoor:(ALCoordiante)coor;
-(id)initWithRandomRoadStateOfPointAtCoor:(ALCoordiante)coor;
-(id)initWithCoor:(ALCoordiante)coor state:(ALPointRoadState)state;

@end
