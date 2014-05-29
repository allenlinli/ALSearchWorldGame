//
//  ALPathExplorer.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/28/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMap.h"

@class ALPath;

/*!
 負責給出最短的路徑
 
 */

@class ALPath;

@interface ALPathExplorer : NSObject


-(ALPath *)exploreShortestPathWithMap:(ALMap *)map;

@end



