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
    
    if (shortestPath) {
        NSLog(@"FOUND shortestPath");
    }
    
    for (NSValue *value in shortestPath.coordinateStack) {
        ALCoordiante coor;
        [value getValue:&coor];
        NSLog(@"coor x:%i  y:%i",coor.x,coor.y);
    }

    //# 根據最短路徑，用動畫的walker逐秒顯示出來
    //## 開始一步一步走
//    self.moveCount = 0;
//    NSInvocation *timerInvocation = [NSInvocation invocationWithMethodSignature:
//                       [self methodSignatureForSelector:@selector(takeAWalkOnShortestPath:)]];
//    [timerInvocation setSelector:@selector(takeAWalkOnShortestPath:)];
//    [timerInvocation setTarget:self];
//    [timerInvocation setArgument:&shortestPath atIndex:2];
//    [NSTimer scheduledTimerWithTimeInterval:walkTimeInterval
//                                            invocation:timerInvocation
//                                               repeats:YES];
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

-(void)takeAWalkOnShortestPath:(ALPath *)shortestPath
{
//    ALPoint *point = shortestPath.coordinateStack[self.moveCount];
//    
//    self.coorOfWalker = point.coor;
//    
//    self.moveCount++;
//    
//    [self.worldView setNeedsDisplay];
}

//-(ALCoordiante)walkerCoordinateForWorldView:(ALWorldView *)worldView{
//    return self.coorOfWalker;
//}

@end
