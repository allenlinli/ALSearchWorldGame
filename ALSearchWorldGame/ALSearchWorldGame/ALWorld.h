//
//  ALWorld.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALWorld : NSObject
@property (readonly, strong, nonatomic) NSArray *twoDPoints;


-(id)initWorld;
-(id)initWorldWithSize:(ALWorldSize)worldSize;

@end
