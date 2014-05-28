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
@property (strong, nonatomic) NSMutableArray *pathsQueue; //包含很多個path的queue
@property (strong, nonatomic) ALMap *map;
@property (strong, readonly,nonatomic) ALPath *shortestPath;

+(NSMutableArray *)newPathsQueueWithMap:(ALMap *)map;

-(void)explorePath:(ALPath *)path withMap:(ALMap *)map;


@end


@interface ALPath : NSObject
@property (strong, nonatomic) NSMutableArray *coordinateStack; //包含很多個ALCoordinate  //不知道怎麼樣readOnly
@property (assign, readonly, nonatomic) ALCoordiante headPointCoordinate;


-(void)pushWithCoordinate:(ALCoordiante)coor;
-(void)pop;

@end
