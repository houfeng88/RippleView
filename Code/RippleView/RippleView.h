//
//  RippleView.h
//  RippleView
//
//  Created by Repeatlink-HouFeng on 16/5/5.
//  Copyright © 2016年 Repeatlink-HouFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RippleView : UIView
@property(nonatomic)CGFloat timeInterval;
@property(nonatomic)NSInteger maxRippleCount;
@property(nonatomic)NSInteger rippleCount;
@property(nonatomic)CGFloat rippleGap;
@property(nonatomic,copy)UIColor *rippleColor;
@property(nonatomic)CGFloat rippleWidth;
-(void)doAction;
-(void)stop;
@end
