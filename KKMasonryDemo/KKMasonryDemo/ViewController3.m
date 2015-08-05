//
//  ViewController3.m
//  KKMasonryDemo
//
//  Created by bcmac3 on 15/8/5.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

#import "ViewController3.h"
#import "Masonry.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UIView *fatherView;

@property (weak, nonatomic) IBOutlet UIView *sunView;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *c = _sunView.constraints;
//    [_sunView removeConstraints:c];
//    NSArray *v = _fatherView.constraints;
//    [_fatherView removeConstraints:v];
    
    [_fatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.top.equalTo(self.view.mas_top).with.offset(100);;
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20);;
        make.right.equalTo(self.view.mas_right).with.offset(-20);;
    }];
    
    
    [_sunView mas_makeConstraints:^(MASConstraintMaker *make) {
        //上下左贴边
        make.left.equalTo(_fatherView.mas_left);
        make.top.equalTo(_fatherView.mas_top);
        make.bottom.equalTo(_fatherView.mas_bottom);
        //        //宽度为父view的宽度的一半
        make.width.equalTo(_fatherView.mas_width).multipliedBy(0.5);
    }];
   
}




@end
