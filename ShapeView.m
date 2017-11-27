//
//  ShapeView.m
//  LF_CAShapeLayer
//
//  Created by 刘峰 on 16/4/24.
//  Copyright © 2016年 halovv. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame Direction:(NSString*)direction
{
    if (self = [super initWithFrame:frame]) {
        [self shapeLayeWithDirection:direction];
    }
    return self;
}
-(void)shapeLayeWithDirection:(NSString*)direction
{
    CGSize size = self.bounds.size;
    CGMutablePathRef path = CGPathCreateMutable();
    CAShapeLayer *shape = [CAShapeLayer layer];
    if ([direction isEqualToString:@"up"]) {
        CGPathMoveToPoint(path, NULL, 0, size.height);
        CGPoint points[4] ={
            size.width/2,0,
            size.width,size.height,
            size.width/2,size.height*2/3,
            0,size.height,
        };
        CGPathAddLines(path, NULL, points, 4);
    }
    else if ([direction isEqualToString:@"left"]) {
        CGPathMoveToPoint(path, NULL, size.width, 0);
        CGPoint points[4] ={
            0,size.height/2,
            size.width,size.height,
            size.width*2/3,size.height/2,
            size.width,0,
        };
        CGPathAddLines(path, NULL, points, 4);
    }
    else if ([direction isEqualToString:@"right"]) {
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPoint points[4] ={
            size.width,size.height/2,
            0,size.height,
            size.width/3,size.height/2,
            0,0,
        };
        CGPathAddLines(path, NULL, points, 4);
    }
    
    CGPathCloseSubpath(path);
    [shape setPath:path];
    self.layer.mask = shape;
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//}
//
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//    UITouch *touch = [touches anyObject];
//    NSLog(@"%f",[touch locationInView:self].x);
//}


@end
