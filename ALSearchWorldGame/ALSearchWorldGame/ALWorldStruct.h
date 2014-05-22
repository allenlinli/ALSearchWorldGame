//
//  ALPoint.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

typedef struct {
    NSInteger width;
	NSInteger height;
} ALWorldSize;

ALWorldSize ALWorldSizeMake (NSInteger width, NSInteger height);


typedef struct {
    NSInteger coordianteX;
    NSInteger coordianteY;
} ALCoordiante;

ALCoordiante ALCoordianteMake (NSInteger width, NSInteger height);

