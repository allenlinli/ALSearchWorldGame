//
//  ALPath.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALPath.h"
#import "ALPoint.h"
#import "NSValue+ALCoordinate.h"

@implementation ALPath

-(id)copy
{
    ALPath *path = [[ALPath alloc]init];
    path.coordinateStack = [self.coordinateStack mutableCopy];
    
    return path;
}

-(NSArray *)coordinateStack{
    if (!_coordinateStack) {
        _coordinateStack = [[NSMutableArray alloc]init];
    }
    return _coordinateStack;
}

-(ALCoordiante)headPointCoordinate{    
    return [(NSValue *)self.coordinateStack.lastObject coordinate];
}

-(void)pushWithCoordinate:(ALCoordiante)coor{
    if (_coordinateStack) {
        
    }
    [(NSMutableArray *)self.coordinateStack addObject:[[NSValue class] valueWithCoordinate:coor]];
}
-(void)pop{
    [(NSMutableArray *)self.coordinateStack removeLastObject];
}

@end
