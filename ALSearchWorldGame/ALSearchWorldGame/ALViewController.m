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
#import "NSValue+ALCoordinate.h"

const NSTimeInterval walkTimeInterval = 0.5;



@interface ALViewController () <ALWorldViewDatasource>

@property (weak, nonatomic) IBOutlet ALWorldView *worldView;

@property (strong, nonatomic) ALMap *map;
@property (strong, nonatomic) ALPath *shortestPath;

@property (strong, nonatomic) UIView *walkerView;
@end

@implementation ALViewController
{
    NSInteger step;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.worldView.dataSource = self;
    
    self.map = [[ALMap alloc]initWithDefaultData];
    
    ALPathExplorer *explorer = [[ALPathExplorer alloc] init];
    
    self.shortestPath = [explorer exploreShortestPathWithMap:self.map];
    
    for (NSValue *value in self.shortestPath.coordinateStack) {
        ALCoordiante coor;
        [value getValue:&coor];
        NSLog(@"coor x:%i  y:%i",coor.x,coor.y);
    }
    step = -1;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
}

- (void)timerMethod:(NSTimer *)t
{
    if (++step >= [self.shortestPath.coordinateStack count]) {
        [self.walkerView removeFromSuperview];
        [t invalidate];
        return;
    }
    
    ALCoordiante coor = [(NSValue *)self.shortestPath.coordinateStack[step] coordinate];
    CGFloat w = self.worldView.cellWidth;
    CGFloat h = self.worldView.cellHeight;
    CGRect frame = CGRectMake(coor.x * w, coor.y * h, w, h);
    if (!self.walkerView) {
        self.walkerView = [[UIView alloc] initWithFrame:frame];
        self.walkerView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:self.walkerView];
    }
    else {
        self.walkerView.frame = frame;
    }    
}


#pragma mark - WorldView Datasource method

-(NSUInteger)nuberOfRowsForWorldView:(ALWorldView *)worldView{
    return self.map.size.height;
}

-(NSUInteger)nuberOfColumnsForWorldView:(ALWorldView *)worldView{
    return self.map.size.width;
}

-(WorldViewCellRoadState)worldView:(ALWorldView *)worldView roadStateAtCoordinate:(ALCoordiante)coor{
    switch ([self.map pointAtCoor:coor].roadState) {
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


-(ALCoordiante)startPointCoordinateForWorldView:(ALWorldView *)worldView{
    return self.map.startPoint.coor;
}

-(ALCoordiante)endPointCoordinateForWorldView:(ALWorldView *)worldView{
    return self.map.endPoint.coor;
}


@end
