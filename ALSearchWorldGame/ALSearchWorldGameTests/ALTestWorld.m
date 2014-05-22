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
    ALPoint *point = [world pointWithCoor:ALCoordianteMake(0, 0)];
    XCTAssertNotNil(point, @"");
    XCTAssertTrue(point.coor.coordianteX==0 && point.coor.coordianteY==0, @"");
    
    ALPoint *point2 = [world pointWithCoor:ALCoordianteMake(10, 10)];
    XCTAssertNotNil(point2, @"");
    XCTAssertTrue(point2.coor.coordianteX==10 && point.coor.coordianteY==10, @"");
}

@end
