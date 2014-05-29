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


const NSTimeInterval walkTimeInterval = 0.5;

@interface ALViewController () <ALWorldViewDatasource>

@property (weak, nonatomic) IBOutlet ALWorldView *worldView;

@property (strong, nonatomic) ALMap *map;


@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.worldView.dataSource = self;
    
    self.map = [[ALMap alloc]initWithDefaultData];
    
    ALPathExplorer *explorer = [[ALPathExplorer alloc] init];
    
    ALPath *shortestPath = [explorer exploreShortestPathWithMap:self.map];
    
    ALCoordiante coorOfWalker = ALCoordianteMake(self.map.startPoint.coor.x, self.map.startPoint.coor.y);
    
    NSValue *valueOfCoorOfWalker = [NSValue value:&coorOfWalker withObjCType:@encode(ALCoordiante)];
    

    //根據最短路徑，用動畫的walker逐秒顯示出來
    
    NSInvocation *timerInvocation = [NSInvocation invocationWithMethodSignature:
                       [self methodSignatureForSelector:@selector(walker:takeAWalkOnShortestPath:)]];
    
    // configure invocation
    [timerInvocation setSelector:@selector(walker:takeAWalkOnShortestPath:)];
    [timerInvocation setTarget:self];
    [timerInvocation setArgument:&valueOfCoorOfWalker atIndex:2];   // argument indexing is offset by 2 hidden args
    [timerInvocation setArgument:&shortestPath atIndex:3];
    
    [NSTimer scheduledTimerWithTimeInterval:walkTimeInterval
                                            invocation:timerInvocation
                                               repeats:YES];
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

#pragma mark -

-(void)walker:(NSValue *)valueOfCoorOfWalker takeAWalkOnShortestPath:(ALPath *)shortestPath
{
    
    [self.worldView setNeedsDisplay];
}

@end
