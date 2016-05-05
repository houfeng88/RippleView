//
//  ViewController.m
//  RippleView
//
//  Created by Repeatlink-HouFeng on 16/5/5.
//  Copyright © 2016年 Repeatlink-HouFeng. All rights reserved.
//

#import "ViewController.h"
#import "RippleView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property(nonatomic,weak)RippleView *rippleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RippleView *rippleView = [[RippleView alloc] initWithFrame:CGRectMake(200, 300, 40, 40)];
    rippleView.timeInterval = 0.35;
    rippleView.maxRippleCount = 5;
    rippleView.rippleWidth = 2.5;
    rippleView.rippleGap = 16;
    rippleView.rippleCount = 2;
    [self.view addSubview:rippleView];
    self.rippleView = rippleView;
    self.rippleView.center = self.startBtn.center;
    [self.view sendSubviewToBack:self.rippleView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchDown:(id)sender {
     [self.rippleView doAction];
}
- (IBAction)action:(id)sender {
   
}
- (IBAction)stop:(id)sender {
    [self.rippleView stop];
}

@end
