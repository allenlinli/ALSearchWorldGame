//
//  ALPathExplorerTest.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALPathExplorer.h"
#import "NSValue+ALCoordinate.h"
#import <objc/message.h>

@interface ALPathExplorer (Privates)
+(NSMutableArray *)newPathsQueueWithMap:(ALMap *)map;
-(ALPath *)exploreShortestPathWithMap:(ALMap *)map;
-(NSArray *)exploreNewRoadPointsWithPath:(ALPath *)path map:(ALMap *)map;
-(void)pushToPathsQueue:(NSMutableArray *)pathsQueue with:(ALPath *)path;
-(ALPath *)popFromPathsQueue:(NSMutableArray *)pathsQueue;
@end

@interface ALPathExplorerTest : XCTestCase
@property (strong, nonatomic) ALPathExplorer *explorer;
@property (strong, nonatomic) ALMap *map;
@end

@implementation ALPathExplorerTest

- (void)setUp
{
    [super setUp];
    self.explorer = [[ALPathExplorer alloc] init];
    self.map = [[ALMap alloc]initWithDefaultData];
    
    
//    [ALPathExplorer class] per
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)printPathsQueue:(NSMutableArray *)pathsQueue{
    NSLog(@"Print PathsQueue");
    for (ALPath *path in pathsQueue) {
        NSLog(@"path:%@   head:(%i,%i)",path,path.headPointCoordinate.x,path.headPointCoordinate.y);
        [self printPath:path];
    }
}

-(void)printPath:(ALPath *)path
{
    NSLog(@"Print a Path");
    for (NSValue *value in path.coordinateStack) {
        ALCoordiante coor = [value coordinate];
        NSLog(@"coor:(%i,%i)",coor.x,coor.y);
    }
}

-(void)printALCoordiante:(ALCoordiante)coor
{
    NSLog(@"printALCoordiante");
    NSLog(@"coor:(%i,%i)",coor.x,coor.y);
}



-(void)testNewPathsQueueWithMap
{
    NSMutableArray *pathsQueue = (NSMutableArray *)objc_msgSend([ALPathExplorer class], @selector(newPathsQueueWithMap:), self.map);
    XCTAssertNotNil(pathsQueue, @"");
    XCTAssertEqual(pathsQueue.count, 1, @"");
    
    
    ALPath *path = pathsQueue.firstObject;
    XCTAssertNotNil(path, @"");
    
    ALCoordiante coor = [(NSValue *)[path.coordinateStack firstObject] coordinate];
    ALCoordiante coorOfStartPoint = self.map.startPoint.coor;
    XCTAssert(coor.x==coorOfStartPoint.x && coor.y==coorOfStartPoint.y,@"");
}

-(void)testExploreRoadPointsWithPath
{
    NSMutableArray *pathsQueue = [ALPathExplorer newPathsQueueWithMap:self.map];

    //拿出一個path
    ALPath *choosedPath = [self.explorer popFromPathsQueue:pathsQueue];
    NSArray *exploredPoints = [self.explorer exploreNewRoadPointsWithPath:choosedPath map:self.map];
    
    XCTAssertNotNil(exploredPoints, @"");
    XCTAssertEqual(exploredPoints.count, 2, @"");
    
    ALPoint *point0 = exploredPoints[0];
    ALPoint *point1 = exploredPoints[1];
    
    XCTAssertEqual(point0.roadState, ALPointRoadStateRoad, @"");
    XCTAssertEqual(point1.roadState, ALPointRoadStateRoad, @"");
    
    XCTAssertEqual(point1.searchState, ALPointSearchStateNew, @"");
    XCTAssertEqual(point1.searchState, ALPointSearchStateNew, @"");
    
    XCTAssert(point0.coor.x == 2 && point0.coor.y ==1, @"");
    XCTAssert(point1.coor.x == 1 && point1.coor.y ==2, @"");
    
    
    
    //把新的點加進path
    point0.searchState = ALPointSearchStateWalked;
    ALPath *newPath0 = [choosedPath copy];
    [newPath0 pushWithCoordinate:point0.coor];
//    [self printPath:newPath0];
    [self printALCoordiante:newPath0.headPointCoordinate];
    
    NSArray *exploredPoints0 = [self.explorer exploreNewRoadPointsWithPath:newPath0 map:self.map];

    for (ALPoint *points in exploredPoints0) {
        [self printALCoordiante:points.coor];
    }
    
    XCTAssertNotNil(exploredPoints0, @"");
    XCTAssertEqual(exploredPoints0.count, 1, @"");
    
    ALPoint *point3 = exploredPoints0[0];
    
    XCTAssertEqual(point3.roadState, ALPointRoadStateRoad, @"");
    XCTAssertEqual(point3.searchState, ALPointSearchStateNew, @"");
    XCTAssert(point3.coor.x == 3 && point3.coor.y ==1, @"");
}


@end
