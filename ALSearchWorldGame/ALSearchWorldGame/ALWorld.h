//
//  ALWorld.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALPoint.h"
#import "ALWorldStruct.h"

extern const NSUInteger ALWorldInitialWidth;
extern const NSUInteger ALWorldInitialHeight;

@interface ALWorld : NSObject

#pragma - CREATE
@property (readonly, strong, nonatomic) NSArray *twoDPoints; //產生的座標點皆是正數
@property (assign, readonly, nonatomic) ALWorldSize size;
@property (strong, readonly, nonatomic) ALPoint *startPoint;
@property (strong, readonly, nonatomic) ALPoint *endPoint;



-(id)initWorldWithDefaultSize;

#pragma - GET
-(ALPoint const *)pointAtCoor:(ALCoordiante) coor;

#pragma - UPDATE
-(void)changePointAtCoor:(ALCoordiante)coor withSearchState:(ALPointSearchState)searchState;

    
@end
