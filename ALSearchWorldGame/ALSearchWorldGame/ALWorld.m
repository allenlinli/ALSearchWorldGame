//
//  ALWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALWorld.h"
#import "ALPoint.h"

const NSUInteger ALWorldInitialWidth = 100;
const NSUInteger ALWorldInitialHeight = 100;

@implementation ALWorld
-(id)initWorld{
    self = [super init];
    if (self) {
        self = [self initWorldWithSize:ALWorldSizeMake(ALWorldInitialWidth, ALWorldInitialHeight)];
    }
    return self;
}
-(id)initWorldWithSize:(ALWorldSize)worldSize{
    if (worldSize.width <=0 || worldSize.height<=0) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _width = worldSize.width;
        _height = worldSize.height;
        
        NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:worldSize.height];
        for (NSUInteger row = 0; row < worldSize.height; row++) {
            NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:worldSize.width];
            for (NSUInteger column = 0 ; column < worldSize.width; column++) {
                ALPointState state = arc4random() % ALPointStateTotalCount;
                ALPoint *point = [[ALPoint alloc]initWithCoordinateX:row coordinateY:column state:state];
                [rowArray addObject:point];
            }
            [twoDArray addObject:rowArray];
        }
    }
    
    NSLog(@"worldSize.width: %i  worldSize.height:%i",worldSize.width,worldSize.height);
    
    return self;
}

@end
