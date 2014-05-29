//
//  ALWorldStruct.c
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//


#import "ALWorldStruct.h"

ALWorldSize ALWorldSizeMake (NSInteger width, NSInteger height){
    ALWorldSize worldSize;
    worldSize.width = width;
    worldSize.height = height;
    
    return worldSize;
}


ALCoordiante ALCoordianteMake (NSInteger x, NSInteger y){
    ALCoordiante coorindate;
    coorindate.x = x;
    coorindate.y = y;
    
    return coorindate;
}

bool isCoorEqual(ALCoordiante coor1,ALCoordiante coor2){
    return (coor1.x == coor2.x && coor1.y == coor2.y);
}

