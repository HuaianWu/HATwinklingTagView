//
//  TwinkleView.m
//  标签
//
//  Created by 武怀安 on 15/11/9.
//  Copyright © 2015年 HuaianWu. All rights reserved.
//

#import "TwinkleView.h"

@implementation TwinkleView

-(void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, self.center.x, self.center.y, 5, 0, 2*M_PI, 0);
    [[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.2]set];
    CGContextFillPath(ctx);
   
}


@end
