//
//  ViewController.m
//  HybridLanguage
//
//  Created by wangwenjian on 2022/4/18.
//

#import "ViewController.h"
#import "HybridLanguage-Swift.h"

@interface ViewController () {
    
}


@property(assign, nonatomic) NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _testView = [UIView new];
//    [self.view addSubview:_testView];
//    _testView = nil;
//    [self removeTest];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 60, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)action:(UIButton *)btn {
    TestViewController *vc = [TestViewController new];
    vc.block1 = ^{
        self.count ++;
    };
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}


@end
