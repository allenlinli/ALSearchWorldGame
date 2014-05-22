//
//  ALWorldView.h
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALWorld;
@class ALWorldView;

@protocol ALWorldViewDelegate <NSObject>

-(ALWorld *)worldForView:(ALWorldView *)view;

@end

@interface ALWorldView : UIView

@end
