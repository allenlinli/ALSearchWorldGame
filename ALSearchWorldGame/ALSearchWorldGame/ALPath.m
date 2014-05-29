//
//  ALPath.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPath.h"
#import "ALPoint.h"

@implementation ALPath

-(NSArray *)coordinateStack{
    if (!_coordinateStack) {
        _coordinateStack = [[NSMutableArray alloc]init];
    }
    return _coordinateStack;
}

-(ALCoordiante)headPointCoordinate{
    return  [(ALPoint *)self.coordinateStack.firstObject coor];
}

-(void)pushWithCoordinate:(ALCoordiante)coor{
    NSValue *value = [NSValue value:&coor withObjCType:@encode(ALCoordiante)];
    [self.coordinateStack addObject:value];
}
-(void)pop{
    [self.coordinateStack removeLastObject];
}


@end
