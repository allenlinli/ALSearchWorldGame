//
//  NSValue+ALCoordinate.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValue (ALCoordinate)
-(ALCoordiante)coordinate;
+(NSValue *)valueWithCoordinate:(ALCoordiante)coor;
@end
