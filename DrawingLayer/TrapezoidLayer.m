//
//  ZHDrawingTrapezoidLayer.m
//  ZHFigureDrawingLayer
//
//  Created by 周亚楠 on 2019/9/4.
//  Copyright © 2019 Zhou. All rights reserved.
//

#import "TrapezoidLayer.h"

@implementation TrapezoidLayer

- (instancetype)init {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.lineJoin = kCALineJoinRound;
        self.lineCap = kCALineCapRound;
        self.strokeColor = [UIColor blackColor].CGColor;
        self.fillColor = [UIColor clearColor].CGColor;
        self.lineWidth = 2;
        [self drawing];
    }
    return self;
}

- (void)drawing{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat width = 50;
    CGPoint startPoint = CGPointMake(100, 100);
    
    CGPoint endPoint = CGPointMake(100, 300);
    
    [path moveToPoint:CGPointMake(width/4*1+startPoint.x, startPoint.y)];
    [path addLineToPoint:CGPointMake(width/4*3+startPoint.x, startPoint.y)];
    [path addLineToPoint:endPoint];
    [path addLineToPoint:CGPointMake(startPoint.x, endPoint.y)];
    [path addLineToPoint:CGPointMake(width/4*1+startPoint.x, startPoint.y)];
    
    self.path = path.CGPath;
}


@end
