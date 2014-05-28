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
    
    
    
    //畫出格子
    for (NSUInteger row = 0; row <= self.numberOfRows; row++) {
        [self drawHorizontalLineAtCoordinateY:row * self.cellHeight];
    }
    
    for (NSUInteger column = 0; column <= self.numberOfColumns; column++) {
        [self drawVerticalLineAtCoordinateX:column * self.cellWidth];
    }
    
    
//    //畫出文字
//    for (NSUInteger row = 0; row < self.numberOfRows; row++) {
//        for (NSUInteger column = 0; column < self.numberOfColumns; column++) {
//            CGPoint point;
//            point.y = row * self.cellHeight;
//            point.x = column * self.cellWidth;
//            
//            NSString *character = [self.dataSource worldView:self characterAtRow:row column:column];
//            
//            UIFont *font = [UIFont fontWithName:@"Courier" size:CharacterDefaultSize];
//            NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//            style.alignment = NSTextAlignmentCenter;
//            NSDictionary *attr = @{ NSFontAttributeName: font,
//                                    NSParagraphStyleAttributeName: style };
//            [character drawInRect:CGRectMake(point.x, point.y + heightOffsetOfCharacterOfVerticalMiddle, self.cellWidth, self.cellHeight) withAttributes:attr];
//        }
//    }
}

-(void)drawHorizontalLineAtCoordinateY:(NSInteger)coordinateY{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGFloat black[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, black);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, coordinateY);
    CGContextAddLineToPoint(c, self.bounds.size.width, coordinateY);
    CGContextStrokePath(c);
}

-(void)drawVerticalLineAtCoordinateX:(NSUInteger)coordinateX{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGFloat black[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, black);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, coordinateX, 0);
    CGContextAddLineToPoint(c, coordinateX, self.bounds.size.height);
    CGContextStrokePath(c);
}


@end
