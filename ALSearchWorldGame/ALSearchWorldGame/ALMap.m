//
//  ALWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALMap.h"
#import "ALPoint.h"

const NSUInteger ALWorldInitialWidth = 20;
const NSUInteger ALWorldInitialHeight = 40;

@implementation ALMap
-(id)initWorldWithDefaultSize{
    self = [super init];
    if (self) {
        self = [self initWorldWithSize:ALWorldSizeMake(ALWorldInitialWidth, ALWorldInitialHeight)];
    }
    return self;
}

-(id)initWithDefaultData{
    NSArray *my2DPoints =@[@[@1, @1, @1, @1, @1, @1, @1, @1, @1, @1, @1, @1],
    @[@1, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @1],
    @[@1, @0, @1, @1, @1, @1, @1, @1, @0, @1, @1, @1],
    @[@1, @0, @1, @0, @0, @0, @0, @0, @0, @0, @0, @1],
    @[@1, @0, @1, @0, @1, @1, @1, @1, @1, @1, @0, @1],
    @[@1, @0, @1, @0, @1, @0, @0, @0, @0, @0, @0, @1],
    @[@1, @0, @0, @0, @1, @1, @0, @1, @1, @1, @0, @1],
    @[@1, @0, @1, @0, @0, @0, @0, @1, @0, @1, @1, @1],
    @[@1, @0, @1, @1, @0, @1, @0, @0, @0, @0, @0, @1],
    @[@1, @0, @1, @0, @0, @1, @1, @1, @1, @1, @0, @1],
    @[@1, @0, @0, @0, @1, @1, @0, @0, @0, @0, @0, @1],
    @[@1, @1, @1, @1, @1, @1, @1, @1, @1, @1, @1, @1]];

    self = [super init];
    if (!self) {
        return nil;
    }
    
    _size = ALWorldSizeMake(12, 12);
    
    NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:self.size.height];
    for (NSUInteger row = 0; row < self.size.height; row++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:self.size.width];
        for (NSUInteger column = 0 ; column < self.size.width; column++) {
            
            NSNumber *num = [my2DPoints[row] objectAtIndex:column];
            
            ALPointRoadState state = (num.intValue==0)? ALPointRoadStateRoad:ALPointRoadStateWall;
            
            ALPoint *point = [[ALPoint alloc] initWithCoor:ALCoordianteMake(column, row) state:state];
            
            point.searchState = ALPointSearchStateNew;
            
            [rowArray addObject:point];
        }
        [twoDArray addObject:rowArray];
    }
    
    _twoDPoints = twoDArray;
    
    
    _startPoint = [self pointAtCoor:ALCoordianteMake(1, 1)];
    _startPoint.roadState = ALPointRoadStateStart;
    
    _endPoint = [self pointAtCoor:ALCoordianteMake(8, 7)];
    _endPoint.roadState = ALPointRoadStateEnd;
    
    return self;
}

-(id)initWorldWithSize:(ALWorldSize)worldSize{
    if (worldSize.width <=0 || worldSize.height<=0) {
        NSLog(@"[BUG]");
        return nil;
    }
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _size = worldSize;
    
    NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:worldSize.height];
    for (NSUInteger row = 0; row < worldSize.height; row++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:worldSize.width];
        for (NSUInteger column = 0 ; column < worldSize.width; column++) {
            ALCoordiante coor = ALCoordianteMake(row, column);
            ALPoint *point = [[ALPoint alloc] initWithRandomRoadStateOfPointAtCoor:coor];
            [rowArray addObject:point];
        }
        [twoDArray addObject:rowArray];
    }
    
    _twoDPoints = twoDArray;
    
    
    //產生隨機的起點和中點，兩個點不能一樣
    NSUInteger randomStartPointCoorX = arc4random() % self.size.width;
    NSUInteger randomStartPointCoorY = arc4random() % self.size.height;
    _startPoint = [[ALPoint alloc] initWithCoor:ALCoordianteMake(randomStartPointCoorX, randomStartPointCoorY) state:ALPointRoadStateStart];
    
    do {
        NSUInteger randomEndPointCoorX = arc4random() % self.size.width;
        NSUInteger randomEndPointCoorY = arc4random() % self.size.height;
        _endPoint = [[ALPoint alloc] initWithCoor:ALCoordianteMake(randomEndPointCoorX, randomEndPointCoorY) state:ALPointRoadStateEnd];
    } while (_endPoint.coor.x == _startPoint.coor.x && _endPoint.coor.y == _startPoint.coor.y);
    
    return self;
}


-(ALPoint *) pointAtCoor:(ALCoordiante) coor {
    if (coor.x >= self.size.width || coor.y >= self.size.height) {
        NSLog(@"[BUG]");
        return 0;
    }
    
    NSArray *rowArray = self.twoDPoints[coor.y];
    ALPoint *point = rowArray[coor.x];
    return point;
}

-(void)changePointAtCoor:(ALCoordiante)coor withSearchState:(ALPointSearchState)searchState{
    NSMutableArray *rowArray = self.twoDPoints[coor.y];
    ALPoint *point = rowArray[coor.x];
    point.searchState = searchState;
    rowArray[coor.x] = point;
//    [rowArray replaceObjectAtIndex:coor.coordianteX withObject:point];
}

@end
