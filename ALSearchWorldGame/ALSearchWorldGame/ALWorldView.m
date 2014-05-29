//
//  ALWorldView.m
//  ALSearchWorldGame
//
//  Created by allenlin on 5/22/14.
//  Copyright (c) 2014 Raccoonism. All rights reserved.
//

#import "ALWorldView.h"

@interface ALWorldView ()
@property (assign,nonatomic) NSUInteger numberOfRows;
@property (assign,nonatomic) NSUInteger numberOfColumns;

@property (assign,nonatomic) CGFloat cellWidth;
@property (assign,nonatomic) CGFloat cellHeight;

@end

@implementation ALWorldView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (!self.dataSource || ![self.dataSource respondsToSelector:@selector(nuberOfRowsForWorldView:)] || ![self.dataSource respondsToSelector:@selector(nuberOfColumnsForWorldView:)]) {
        return;
    }
    
    //設定 property
    _numberOfRows = [self.dataSource nuberOfRowsForWorldView:self];
    _numberOfColumns = [self.dataSource nuberOfColumnsForWorldView:self];
    
    _cellWidth = self.bounds.size.width / (CGFloat) self.numberOfColumns;
    _cellHeight = self.bounds.size.height / (CGFloat) self.numberOfRows;
    
    
    for (NSUInteger row=0; row < self.numberOfRows ; row++) {
        for (NSUInteger column = 0; column < self.numberOfColumns ; column++) {
            switch ([self.dataSource worldView:self roadStateAtCoordinate:ALCoordianteMake(column, row)]) {
                case WorldViewCellRoadStateWall:
                    break;
                case WorldViewCellRoadStateRoad:
                    [self drawCellAtCoordinate:ALCoordianteMake(column, row) color:[UIColor grayColor] character:nil];
                    break;
                default:
                    break;
            }
        }
    }
    
    //畫起點終點
    ALCoordiante startPoint = [self.dataSource startPointCoordinateForWorldView:self];
    ALCoordiante endPoint = [self.dataSource endPointCoordinateForWorldView:self];
    
    [self drawCellAtCoordinate:ALCoordianteMake(startPoint.x, startPoint.y) color:[UIColor yellowColor]  character:@"S"];
    [self drawCellAtCoordinate:ALCoordianteMake(endPoint.x, endPoint.y) color:[UIColor blueColor]  character:@"E"];

}

-(void)drawCellAtCoordinate:(ALCoordiante)coor color:(UIColor *)color character:(NSString *)character{
    if (!color) {
        color = [UIColor whiteColor];
    }
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0);
    CGRect rectangle = CGRectMake(coor.x*self.cellWidth,coor.y*self.cellHeight,self.cellWidth,self.cellHeight);
    if (character) {
        [character drawAtPoint:CGPointMake(coor.x*self.cellWidth,coor.y*self.cellHeight) withAttributes:nil];
    }
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rectangle);
}

@end
