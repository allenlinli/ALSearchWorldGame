//
//  ALPathExplorer.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/28/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMap.h"

@class ALPath;

@interface ALPathExplorer : NSObject
@property (strong, nonatomic) NSArray *pathsQueue;
@property (strong, nonatomic) ALMap *map;

-(id)initWithDefaultMap;

-(void)explorePath:(ALPath *)path;

-(NSArray *)coordinatesOfNewPointOnPath:(ALPath *)path;

@end


@interface ALPath : NSObject
@property (strong, readonly, nonatomic) NSArray *points;
@property (assign, readonly, nonatomic) ALCoordiante *headPointCoordinate;

// distanceFromHeadPointOfPathToEndPoint

-(void)pushPointWithCoordinate:(ALCoordiante)coor;
-(void)popPointWithCoordinate:(ALCoordiante)coor;

@end
