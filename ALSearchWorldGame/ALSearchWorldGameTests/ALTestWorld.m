//
//  ALTestWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ALTestWorld : XCTestCase
@property (strong, nonatomic) ALWorld *world;
@end

@implementation ALTestWorld

- (void)setUp
{
    self.world = [[ALWorld alloc]initWorld];
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInit
{
    XCTAssertNotNil(self.world, @"");
    XCTAssertTrue(self.world.width == ALWorldInitialWidth && self.world.height == ALWorldInitialHeight  ,@"");
    
}

- (void)testPointWithCoor
{
    ALWorld *world = self.world;
    const ALPoint *point = [world pointWithCoor:ALCoordianteMake(0, 0)];
    XCTAssertNotNil(point, @"");
    XCTAssertTrue(point.coordinate.x==0 && point.coordinate.y==0, @"");
    
    const ALPoint *point2 = [world pointWithCoor:ALCoordianteMake(10, 10)];
    XCTAssertNotNil(point2, @"");
    XCTAssertTrue(point2.coordinate.x==10 && point2.coordinate.y==10, @"");
}

- (void)testChangePointState
{
    ALWorld *world = self.world;
    const ALPoint *point = [world pointWithCoor:ALCoordianteMake(0, 0)];
    ALPointState oldState = point.state;
    ALPointState changedState = (oldState == ALPointStateRoad)? ALPointStateWall : ALPointStateRoad;
    
    [world changePointState:changedState withCoor:point.coordinate];
    
    XCTAssertNotNil(point, @"");
    XCTAssertEqual(point.state, changedState, @"");
    XCTAssertNotEqual(point.state, oldState, @"");
}

@end
