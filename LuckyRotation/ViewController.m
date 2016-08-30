//
//  ViewController.m
//  LuckyRotation
//
//  Created by zsq on 16/8/30.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"
@interface ViewController ()
@property (nonatomic, strong) WheelView *wheelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WheelView *wheel = [WheelView wheelView];
    wheel.center = self.view.center;
    [self.view addSubview:wheel];
    self.wheelView = wheel;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotation:(id)sender {
    [self.wheelView rotation];
}

- (IBAction)stop:(id)sender {
    [self.wheelView stop];
}
@end
