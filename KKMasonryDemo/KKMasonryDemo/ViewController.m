//
//  ViewController.m
//  KKMasonryDemo
//
//  Created by bcmac3 on 15/8/5.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /*
        左边Label一定显示完全，右边的按情况
     */
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.equalTo(@200);
    }];
    
    UILabel *label1 = [UILabel new];
    label1.backgroundColor = [UIColor orangeColor];
    [contentView addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.backgroundColor = [UIColor grayColor];
    [contentView addSubview:label2];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top).with.offset(20);
        make.left.equalTo(contentView.mas_left).with.offset(10);
//        make.right.equalTo(label2.mas_left).with.offset(-10);
        make.height.equalTo(@40);
        
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top).with.offset(20);
        make.left.equalTo(label1.mas_right).with.offset(10);
        make.right.equalTo(contentView.mas_right).with.offset(-10);
        make.height.equalTo(@40);
    }];
    //根据compression 来判断谁显示完全
    //设置label1的content hugging 为1000
    [label1 setContentHuggingPriority:UILayoutPriorityRequired
                              forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000
    [label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                            forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content hugging 为1000
    [label2 setContentHuggingPriority:UILayoutPriorityRequired
                              forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content compression 为250
    [label2 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                            forAxis:UILayoutConstraintAxisHorizontal];

    
    label1.text = @"sdaaoihdk;fbafklfvdasada;dfkbf";
    label2.text = @"flhdafklfsfsfsfsfsdfsfsfsf";
    
    
    
}



@end
