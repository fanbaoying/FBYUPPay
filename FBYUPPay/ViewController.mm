//
//  ViewController.m
//  FBYUPPay
//
//  Created by fby on 2021/1/27.
//

#import "ViewController.h"
#import "UPPaymentControl.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *uppayBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 50)];
    [uppayBtn setTitle:@"银联支付" forState:0];
    uppayBtn.backgroundColor = [UIColor lightGrayColor];
    [uppayBtn addTarget:self action:@selector(uppayBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uppayBtn];
    
}

-(void)uppayBtn:(UIButton *)sender {
    // 通过服务端接口获取
    NSString *tn = @"";
    if (tn != nil && tn.length > 0) {
        [[UPPaymentControl defaultControl] startPay:tn fromScheme:@"FBYUPPay" mode:@"01" viewController:self];
    } else {
        NSLog(@"请填写有效的 tn 值");
    }
}

@end
