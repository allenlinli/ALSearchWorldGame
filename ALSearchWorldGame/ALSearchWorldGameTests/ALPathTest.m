//
//  ALPathTest.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALPath.h"
#import "NSValue+ALCoordinate.h"

@interface ALPathTest : XCTestCase
@property (strong, nonatomic) ALPath *path;
@property (assign, nonatomic) ALCoordiante coor;
@end

@implementation ALPathTest

- (void)setUp
{
    [super setUp];
    self.path = [[ALPath alloc]init];
    self.coor = ALCoordianteMake(2, 3);
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPushWithCoordinate
{
    [self.path pushWithCoordinate:self.coor];
    XCTAssertNotNil(self.path, @"");
}

-(void)testHeadPointCoordinate
{
    [self.path pushWithCoordinate:self.coor];
    [self.path pushWithCoordinate:ALCoordianteMake(3, 3)];
    ALCoordiante coor = self.path.headPointCoordinate;
    
    XCTAssert(coor.x==3 && coor.y==3, @"");
}

- (void)testPop
{
    [self.path pushWithCoordinate:ALCoordianteMake(2, 2)];
    [self.path pop];
    XCTAssertNotNil(self.path, @"");
    XCTAssertEqual(self.path.coordinateStack.count, 0, @"");
}

-(void)testNSValueCoordinate{
    ALCoordiante coor = ALCoordianteMake(2, 3);
    
    NSValue *value = [NSValue value:&coor withObjCType:@encode(ALCoordiante)];
    ALCoordiante coorOut = value.coordinate;
    XCTAssert(coorOut.x == 2 && coorOut.y==3, @"");
}

-(void)testValueWithCoordinate{
    ALCoordiante coor = ALCoordianteMake(2, 3);
    
    NSValue *value = [NSValue valueWithCoordinate:coor];
    ALCoordiante coorOut;
    [value getValue:&coorOut];
    
    XCTAssertNotNil(value, @"");
    XCTAssert(coorOut.x == 2 && coorOut.y==3, @"");
}

//@property (strong, nonatomic) NSMutableArray *coordinateStack; //包含很多個ALCoordinate  //不知道怎麼樣readOnly
//@property (assign, readonly, nonatomic) ALCoordiante headPointCoordinate;

//-(void)pop;



@end
