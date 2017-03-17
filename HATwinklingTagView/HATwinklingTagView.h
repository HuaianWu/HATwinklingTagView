//
//  TagView.m
//  标签
//
//  Created by 武怀安 on 15/11/9.
//  Copyright © 2015年 HuaianWu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TwinkleView.h"
@interface HATwinklingTagView : UIView
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)TwinkleView *twinkle;
@property(nonatomic,strong)UIColor *color;


-(instancetype)initWithWithArray:(NSArray *)array andPoint:(CGPoint)point;
@end
