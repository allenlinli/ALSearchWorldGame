//
//  ALViewController.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALViewController.h"
#import "ALWorldView.h"

@interface ALViewController ()
@property (strong, nonatomic) ALWorld *world;
@property (weak, nonatomic) IBOutlet ALWorldView *WorldView;
@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.world = [[ALWorld alloc] init];

    [self.WorldView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
