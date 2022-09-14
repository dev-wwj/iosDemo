//
//  ViewController.m
//  EraseImage
//
//  Created by wangwenjian on 2022/2/21.
//

#import "ViewController.h"
#import "CZPointView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CZPointView *pointView = [[CZPointView alloc] init];
    pointView.frame = self.view.bounds;
    pointView.currentColor = UIColor.redColor;
    [self.view addSubview:pointView];
    
}


@end
