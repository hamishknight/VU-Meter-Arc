//
//  view.m
//  VU Meter
//
//  Created by Hamish Knight on 27/01/2016.
//  Copyright © 2016 Redonkulous Apps. All rights reserved.
//

#import "view.h"

static inline void drawGraduation(CGPoint center, CGFloat radius, CGFloat angle, CGFloat length, CGFloat width, CGColorRef color) {
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat radius2 = radius+length; // The radius of the end points of the graduations
    CGPoint p1 = (CGPoint){cos(angle)*radius+center.x, sin(angle)*radius+center.y}; // the start point of the graduation
    CGPoint p2 = (CGPoint){cos(angle)*radius2+center.x, sin(angle)*radius2+center.y}; // the end point of the graduation
    
    CGContextMoveToPoint(c, p1.x, p1.y);
    CGContextAddLineToPoint(c, p2.x, p2.y);
    
    CGContextSetStrokeColorWithColor(c, color);
    CGContextSetLineWidth(c, width);
    
    CGContextStrokePath(c);
}

@implementation view

-(instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGRect r = self.bounds;
    
    CGFloat startAngle = -M_PI*0.2; // start angle of the main arc
    CGFloat endAngle = -M_PI*0.8; // end angle of the main arc
    
    NSUInteger numberOfGraduations = 15;
    CGPoint center = (CGPoint){r.size.width*0.5, r.size.height*0.5}; // center of arc
    CGFloat radius = (r.size.width*0.5)-20; // radius of arc
    
    CGFloat maxGraduationWidth = 1.5; // the maximum graduation width
    CGFloat maxGraduationWidthAngle = maxGraduationWidth/radius; // the maximum graduation width angle (used to prevent the graduations from being stroked outside of the main arc)
    
    // draw graduations
    CGFloat deltaArc = (endAngle-startAngle+maxGraduationWidthAngle)/numberOfGraduations; // the change in angle of the arc
    CGFloat startArc = startAngle-(maxGraduationWidthAngle*0.5); // the starting angle of the arc
    
    for (int i = 0; i <= numberOfGraduations; i++) {
        if (i % 5 == 0) {
            drawGraduation(center, radius, startArc+(i*deltaArc), 14, 1.5, [UIColor redColor].CGColor); // red graduation every 5 graduations.
        } else {
            drawGraduation(center, radius, startArc+(i*deltaArc), 10, 1, [UIColor blackColor].CGColor);
        }
        
    }
    
    // draw main arc
    UIBezierPath* mainArc = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:NO];
    [[UIColor blackColor] setStroke];
    mainArc.lineWidth = 2;
    [mainArc stroke];
    
}


@end
