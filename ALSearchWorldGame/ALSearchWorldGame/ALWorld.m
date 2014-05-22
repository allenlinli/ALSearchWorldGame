//
//  ALWorld.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALWorld.h"
#import "ALPoint.h"

@implementation ALWorld
-(id)initWorld{
    self = [super init];
    if (self) {
        self = [self initWorldWithSize:ALWorldSizeMake(100, 100)];
    }
    return self;
}
-(id)initWorldWithSize:(ALWorldSize)worldSize{
    if (worldSize.width <=0 || worldSize.height<=0) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        NSMutableArray *twoDArray = [[NSMutableArray alloc]initWithCapacity:worldSize.height];
        for (NSUInteger row = 0; row < worldSize.height; row++) {
            NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:worldSize.width];
            for (NSUInteger column = 0 ; column < worldSize.width; column++) {
//                ALPoint point = 
//                rowArray addObject:
            }
        }
    }
    
    return nil;
}

@end
