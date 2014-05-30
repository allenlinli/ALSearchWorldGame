//
//  ALPath.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/29/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALPath : NSObject
@property (strong, nonatomic) NSArray *coordinateStack; //包含很多個ALCoordinate  //不知道怎麼樣readOnly
@property (assign, readonly, nonatomic) ALCoordiante headPointCoordinate;


-(void)pushWithCoordinate:(ALCoordiante)coor;
-(void)pop;

@end
