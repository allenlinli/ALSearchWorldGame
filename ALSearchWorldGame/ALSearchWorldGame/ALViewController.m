//
//  ALViewController.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALViewController.h"
#import "ALWorldView.h"
#import "ALPathExplorer.h"

@interface ALViewController () <ALWorldViewDatasource>
@property (strong, nonatomic) ALPathExplorer *explorer;
@property (weak, nonatomic) IBOutlet ALWorldView *worldView;
@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.explorer = [[ALPathExplorer alloc] init];
    
    self.explorer.map = [[ALMap alloc] initWithDefaultData];
    
    self.explorer.pathsQueue = [[self.explorer class] newPathsQueueWithMap:self.explorer.map];
    
    self.worldView.dataSource = self;
    [self.worldView setNeedsDisplay];
}

#pragma mark - WorldView Datasource method

-(NSUInteger)nuberOfRowsForWorldView:(ALWorldView *)worldView{
    return self.explorer.map.size.height;
}

-(NSUInteger)nuberOfColumnsForWorldView:(ALWorldView *)worldView{
    return self.explorer.map.size.width;
}

-(WorldViewCellRoadState)worldView:(ALWorldView *)worldView roadStateAtCoordinate:(ALCoordiante)coor{
    switch ([self.explorer.map pointAtCoor:coor].roadState) {
        case ALPointRoadStateRoad:
            return WorldViewCellRoadStateRoad;
            break;
        case ALPointRoadStateWall:
            return WorldViewCellRoadStateWall;
            break;
        default:
            break;
    }
    return WorldViewCellRoadStateWall;
}

-(WorldViewCellSearchState)worldView:(ALWorldView *)worldView searchStateAtCoordinate:(ALCoordiante)coor{
    switch ([self.explorer.map pointAtCoor:coor].roadState) {
        case ALPointSearchStateWalked:
            return WorldViewCellSearchStateWalked;
            break;
        case ALPointSearchStateNew:
            return WorldViewCellSearchStateNew;
            break;
        default:
            break;
    }
    return WorldViewCellSearchStateNew;
}

-(ALCoordiante)startPointCoordinateForWorldView:(ALWorldView *)worldView{
    return self.explorer.map.startPoint.coor;
}

-(ALCoordiante)endPointCoordinateForWorldView:(ALWorldView *)worldView{
    return self.explorer.map.endPoint.coor;
}
@end
