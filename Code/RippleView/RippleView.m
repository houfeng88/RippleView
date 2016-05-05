//
//  RippleView.m
//  RippleView
//
//  Created by Repeatlink-HouFeng on 16/5/5.
//  Copyright © 2016年 Repeatlink-HouFeng. All rights reserved.
//

#import "RippleView.h"

@interface RippleViewLayer : CAShapeLayer
@property(nonatomic)CGFloat startRadius;
@property(nonatomic)CGFloat endRadius;
@property(nonatomic)NSInteger index;
@end

@implementation RippleViewLayer
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    self.hidden = YES;
//    self.opacity = 0.0;
    [self removeFromSuperlayer];

}

@end
@interface RippleView ()
@property(nonatomic,strong)NSMutableArray *layers;
@property(nonatomic,strong)NSTimer *timer;
@end



@implementation RippleView{
    CGFloat _startRadius;
    
    NSInteger _count;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.layers = [[NSMutableArray alloc] init];
    self.timeInterval = 0.15;
    self.maxRippleCount = 10;
    _count = 0;
    _startRadius = 5;
    self.rippleGap = 10;
    self.rippleWidth = 2;
    self.rippleColor = [UIColor colorWithRed:83/255.0 green:147/255.0 blue:215/255.0 alpha:1];
    self.backgroundColor = [UIColor clearColor];
    self.rippleCount = 2;
    return self;

}
-(void)stop{
    [self.timer invalidate ];
    self.timer = nil;
}
-(void)update{
    if(_count >  self.maxRippleCount ){
        [self.timer invalidate ];
        self.timer = nil;
        _count = 0;
        return;
    }
    CGFloat time = 0.8;
    CGPoint position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    for(int i =0; i< self.rippleCount ; i++){
        RippleViewLayer *circleLayer = [RippleViewLayer layer];
        circleLayer.lineWidth = self.rippleWidth;
        circleLayer.backgroundColor = [UIColor greenColor].CGColor;
        circleLayer.fillColor = [UIColor  clearColor].CGColor;
        circleLayer.strokeColor = self.rippleColor.CGColor;
        circleLayer.lineCap = kCALineCapRound;
        circleLayer.startRadius =_startRadius + i * self.rippleGap;
        circleLayer.endRadius  = self.frame.size.width;
        circleLayer.position = position;
        [self.layer addSublayer:circleLayer];
        circleLayer.opacity = 0.0;
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
        anim.fromValue = (id) [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:circleLayer.startRadius startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
        anim.toValue = (id) [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:circleLayer.endRadius startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
        anim.duration = time;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        [circleLayer addAnimation:anim forKey:@"pathAnim"];
        
        CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        anim1.fromValue = (id)[NSNumber numberWithFloat:1.0];
        anim1.toValue = (id) (id)[NSNumber numberWithFloat:0.0];
        anim1.duration = time;
        anim1.autoreverses = NO;
        anim1.removedOnCompletion = NO;
        anim1.delegate = circleLayer;
        [circleLayer addAnimation:anim1 forKey:@"opacityAnim"];
    
    
    }
   
    
    _count ++;

}
-(void)doAction{
    if(self.timer == nil){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
    [self update];
   
}
@end
