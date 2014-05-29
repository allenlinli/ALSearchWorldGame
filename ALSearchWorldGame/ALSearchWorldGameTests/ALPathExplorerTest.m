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
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExploreShortestPathWithMap
//{
//    ALPath *shortestPath = [self.explorer exploreShortestPathWithMap:self.map];
//    XCTAssertNotNil(shortestPath, @"");
//    
//    
//
//    
//}

-(void)exploreRoadPointsWithPath{
    ALPath *choosedPath = [self popFromPathsQueue:pathsQueue];
    NSArray *exploredPoints = [self exploreRoadPointsWithPath:choosedPath map:self.map];
    
    
}

-(void)testNewPathsQueueWithMap{
//    [self.explorer performSelector:@selector(newPathsQueueWithMap) withObject:self.map];
}

@end
