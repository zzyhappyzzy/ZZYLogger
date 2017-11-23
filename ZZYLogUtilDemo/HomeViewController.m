//
//  HomeViewController.m
//  ZZYLogUtilDemo
//
//  Created by zhenzhaoyang on 2017/11/22.
//  Copyright © 2017年 zhenchy. All rights reserved.
//

#import "HomeViewController.h"
#import "ZZYLog.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"LogDemo";
}

- (IBAction)showErrorLog:(id)sender {
    if (arc4random()%2) {
        ZError(@"Simple Error");
    }else {
        ZError(@"Something has go wrong with address %p",self);
    }
}

- (IBAction)showWarningLog:(id)sender {
    if (arc4random()%2) {
        NSString *msg = @"Simple Warning";
        ZWarning(msg);
    }else {
        ZWarning(@"Warning----%d----%@----%p",12,@"msg",self);
    }
}

- (IBAction)showInfoLog:(id)sender {
    if (arc4random()%2) {
        ZInfo(@"Just simple info");
    }else {
        NSString *name = @"Jack";
        ZInfo(@"Hello %@!",name);
    }
}

- (IBAction)showDebugLog:(id)sender {
    if (arc4random()%2) {
        ZDebug(@"Everything is OK");
    }else {
        int a = 12;
        int b = 25;
        ZDebug(@"%d + %d = %d",a,b,(a+b));
    }
}

- (IBAction)logMsgToFile:(id)sender {
    if (arc4random()%2) {
        ZFile(@"Simple message write to file");
    }else {
        ZFile(@"Jack is %d years old. He like %@.",16,@"shopping");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
