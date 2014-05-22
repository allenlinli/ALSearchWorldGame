//
//  ALWorldStruct.c
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#include <stdio.h>


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