//
//  ALPoint.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ALPointStateWall,
    ALPointStateRoad,
    ALPointStateTotalCount  // 計算 enum 的數量
}ALPointState;

@interface ALPoint : NSObject
@property (assign, nonatomic) ALPointState state;
@property (assign, nonatomic) ALCoordiante coor;

-(id)initWithCoor:(ALCoordiante)coor;
-(id)initWithRandomStateWithCoor:(ALCoordiante)coor;
-(id)initWithCoor:(ALCoordiante)coor state:(ALPointState)state;
-(id)initWithCoordinateX:(NSInteger)coordinateX coordinateY:(NSInteger)coordinateY state:(ALPointState)state;

@end
