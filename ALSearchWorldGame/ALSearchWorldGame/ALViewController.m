//
//  ALViewController.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALViewController.h"
#import "ALWorldView.h"
#import "ALWorld.h"

@interface ALViewController () <ALWorldViewDatasource>
@property (strong, nonatomic) ALWorld *world;
@property (weak, nonatomic) IBOutlet ALWorldView *WorldView;
@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.world = [[ALWorld alloc] initWithDefaultData];
    self.WorldView.dataSource = self;
    [self.WorldView setNeedsDisplay];
}

#pragma mark - WorldView Datasource method

-(NSUInteger)nuberOfRowsForWorldView:(ALWorldView *)worldView{
    return self.world.size.height;
}

-(NSUInteger)nuberOfColumnsForWorldView:(ALWorldView *)worldView{
    return self.world.size.width;
}

-(WorldViewCellRoadState)worldView:(ALWorldView *)worldView roadStateAtCoordinate:(ALCoordiante)coor{
    switch ([self.world pointAtCoor:coor].roadState) {
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
    switch ([self.world pointAtCoor:coor].roadState) {
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
    return self.world.startPoint.coor;
}

-(ALCoordiante)endPointCoordinateForWorldView:(ALWorldView *)worldView{
    return self.world.endPoint.coor;
}
@end
