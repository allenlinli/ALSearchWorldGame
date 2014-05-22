//
//  ALWorld.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger ALWorldInitialWidth;
extern const NSUInteger ALWorldInitialHeight;

@interface ALWorld : NSObject
@property (readonly, strong, nonatomic) NSArray *twoDPoints;
@property (assign, readonly, nonatomic) NSUInteger width;
@property (assign, readonly, nonatomic) NSUInteger height;

-(id)initWorld;
-(id)initWorldWithSize:(ALWorldSize)worldSize;

@end
