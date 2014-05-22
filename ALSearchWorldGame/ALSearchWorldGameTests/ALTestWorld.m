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

@end
