//
//  ViewController.m
//  TagViewDemo
//
//  Created by 武怀安 on 2017/3/17.
//  Copyright © 2017年 wuhuaian. All rights reserved.
//

#import "ViewController.h"
#import "HATwinklingTagView.h"
@interface ViewController ()

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kImageHeight 210.0
#define kImageWidth  370.0

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) HATwinklingTagView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //background
    _bgImageView = [UIImageView new];
    _bgImageView.frame = CGRectMake(kScreenWidth/2 - kImageWidth/2, kScreenHeight/2 - kImageHeight/2, kImageWidth, kImageHeight);
    _bgImageView.image = [UIImage imageNamed:@"img"];
    [self.view addSubview:_bgImageView];
    //tagView
    NSArray *array = @[@"哇好美！",@"美翻了！",@"美美美！！！！"];
    _tagView = [[HATwinklingTagView alloc]initWithWithArray:array andPoint:CGPointMake(30, 100)];
    //_tagView.color = [UIColor blackColor];
    [_bgImageView addSubview:_tagView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
