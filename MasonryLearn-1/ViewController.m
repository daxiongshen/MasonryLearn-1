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
//    UIView *sv1 = [UIView new];
//    [sv1 showPlaceHolder];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview:sv1];
//    [sv1 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    
//    3、
//    int padding = 10;
//    
//    UIView *sv2 = [UIView new];
//    sv2.backgroundColor = [UIColor orangeColor];
//    [sv2 showPlaceHolder];
//    [sv addSubview:sv2];
//    
//    UIView *sv3 = [UIView new];
//    sv3.backgroundColor = [UIColor orangeColor];
//    [sv3 showPlaceHolder];
//    [sv addSubview:sv3];
//    
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(sv.mas_left).offset(padding);
//        make.right.equalTo(sv3.mas_left).offset(-padding);
//        make.centerY.equalTo(sv);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    
//    [sv3 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(sv2.mas_right).offset(padding);
//        make.right.equalTo(sv.mas_right).offset(-padding);
//        make.centerY.equalTo(sv);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
//    }];
    
    
//    4、
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.backgroundColor = [UIColor whiteColor];
//    [sv addSubview:scrollView];
//    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
//    }];
//    
//    UIView *container = [UIView new];
//    container.backgroundColor = [UIColor yellowColor];
//    [scrollView addSubview:container];
//    [container mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.width.equalTo(scrollView);
//    }];
//    
//    int count = 10;
//    
//    UIView *lastView = nil;
//    
//    for (int i = 0; i < count; i++) {
//        
//        UIView *subv = [UIView new];
//        [container addSubview:subv];
//        
//        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
//                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
//                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
//                                               alpha:1];
//        
//        [subv mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(container);
//            make.height.mas_equalTo(@(20*i));
//            
//            if (lastView) {
//                make.top.mas_equalTo(lastView.mas_bottom);
//            } else {
//                make.top.mas_equalTo(container.mas_top);
//            }
//            
//        }];
//        
//        lastView = subv;
//        
//    }
//    
//    [container mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(lastView.mas_bottom);
//    }];
    
    
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
