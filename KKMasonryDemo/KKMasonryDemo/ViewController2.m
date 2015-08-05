//
//  ViewController2.m
//  KKMasonryDemo
//
//  Created by bcmac3 on 15/8/5.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

#import "ViewController2.h"
#import "Masonry.h"

@interface ViewController2 ()

@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) NSMutableArray *imgvs;

@property (strong, nonatomic) NSMutableArray *widthConstraints;

@end
#define IMAGE_SIZE 80
@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _widthConstraints = [NSMutableArray array];
    _imgvs = [NSMutableArray array];
    
    CGSize imageViewSize = CGSizeMake(60, 60);
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_contentView];
    
    UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    [_contentView addSubview:imgv];
    [_imgvs addObject:imgv];
    UIImageView *imgv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];;
    [_contentView addSubview:imgv1];
    [_imgvs addObject:imgv1];
    UIImageView *imgv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];;
    [_contentView addSubview:imgv2];
    [_imgvs addObject:imgv2];
    UIImageView *imgv3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];;
    [_contentView addSubview:imgv3];
    [_imgvs addObject:imgv3];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(IMAGE_SIZE));
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(200);
    }];
    
    //分别设置每个imageView的宽高、左边、垂直中心约束，注意约束的对象
    //每个View的左边约束和左边的View的右边相等=。=，有点绕口...
    
    UIImageView *imageView1 = _imgvs[0];
    MASConstraint *width = [self setView:imageView1 size:imageViewSize left:_contentView.mas_left centerY:_contentView.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView2 = _imgvs[1];
    width = [self setView:imageView2 size:imageViewSize left:imageView1.mas_right centerY:_contentView.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView3 = _imgvs[2];
    width = [self setView:imageView3 size:imageViewSize left:imageView2.mas_right centerY:_contentView.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView4 = _imgvs[3];
    width = [self setView:imageView4 size:imageViewSize left:imageView3.mas_right centerY:_contentView.mas_centerY];
    [_widthConstraints addObject:width];
    
    //最后设置最右边的imageView的右边与父view的最有对齐
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_contentView.mas_right).with.offset(-10);
    }];
}

/**
 *  设置view的宽高、左边约束，垂直中心约束
 *
 *  @param view    要设置的view
 *  @param size    CGSize
 *  @param left    左边对齐的约束
 *  @param centerY 垂直中心对齐的约束
 *
 *  @return 返回宽约束，用于显示、隐藏单个view
 */
- (MASConstraint *)setView:(UIView *)view size:(CGSize)size left:(MASViewAttribute *)left centerY:(MASViewAttribute *)centerY {
    
    __block MASConstraint *widthConstraint;
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽高固定
        widthConstraint = make.width.equalTo(@(size.width));
        make.height.equalTo(@(size.height));
        //左边约束
        make.left.equalTo(left).with.offset(10);
        //垂直中心对齐
        make.centerY.equalTo(centerY);
    }];
    
    return widthConstraint;
}

- (IBAction)showOrHideImage:(UISwitch *)sender {
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *width = _widthConstraints[index];
    
    if (sender.on) {
        width.equalTo(@(60));
    } else {
        width.equalTo(@0);
    }
}

@end
