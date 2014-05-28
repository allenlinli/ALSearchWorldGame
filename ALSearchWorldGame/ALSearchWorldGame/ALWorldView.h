//
//  ALWorldView.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    WorldViewCellRoadStateRoad,
    WorldViewCellRoadStateWall,
    WorldViewCellRoadStateWalker,
} WorldViewCellRoadState;

typedef enum : NSUInteger {
    WorldViewCellSearchStateNew,
    WorldViewCellSearchStateWalked,
} WorldViewCellSearchState;

@class ALWorldView;

@protocol ALWorldViewDatasource <NSObject>
-(NSUInteger)nuberOfRowsForWorldView:(ALWorldView *)worldView;
-(NSUInteger)nuberOfColumnsForWorldView:(ALWorldView *)worldView;
-(WorldViewCellRoadState)worldView:(ALWorldView *)worldView roadStateAtCoordinate:(ALCoordiante)coor;
-(WorldViewCellSearchState)worldView:(ALWorldView *)worldView searchStateAtCoordinate:(ALCoordiante)coor;

-(ALCoordiante)startPointCoordinateForWorldView:(ALWorldView *)worldView;
-(ALCoordiante)endPointCoordinateForWorldView:(ALWorldView *)worldView;
@end

@interface ALWorldView : UIView
@property (weak, nonatomic) id <ALWorldViewDatasource> dataSource;
@end
