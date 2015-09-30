//
//  ViewController.m
//  MasonryLearn-1
//
//  Created by caodaxun_iMac on 15/9/30.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <MMPlaceHolder.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    //    1、
    //    UIView *sv1 = [UIView new];
    //    [sv1 showPlaceHolder];
    //    sv1.backgroundColor = [UIColor redColor];
    //    [sv addSubview:sv1];
    //    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    //    }];
    
    
    //    2、
    int padding = 10;
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor orangeColor];
    [sv2 showPlaceHolder];
    [sv addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor orangeColor];
    [sv3 showPlaceHolder];
    [sv addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sv.mas_left).offset(padding);
        make.right.equalTo(sv3.mas_left).offset(-padding);
        make.centerY.equalTo(sv);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sv2.mas_right).offset(padding);
        make.right.equalTo(sv.mas_right).offset(-padding);
        make.centerY.equalTo(sv);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
