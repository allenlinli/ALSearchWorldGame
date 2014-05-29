//
//  NSValue+ALCoordinate.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "NSValue+ALCoordinate.h"
#import "ALWorldStruct.h"

@implementation NSValue (ALCoordinate)
-(ALCoordiante)coordinate{
    ALCoordiante coor;
    [self getValue:&coor];
    return coor;
}

+(NSValue *)valueWithCoordinate:(ALCoordiante)coor{
    return [NSValue value:&coor withObjCType:@encode(ALCoordiante)];
}

@end
