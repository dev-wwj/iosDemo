//
//  ViewController.m
//  DrawingLayer
//
//  Created by wangwenjian on 2022/3/29.
//

#import "ViewController.h"
#import "TrapezoidLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TrapezoidLayer *layer = [TrapezoidLayer layer];
    [self.view.layer addSublayer:layer];
}


@end
