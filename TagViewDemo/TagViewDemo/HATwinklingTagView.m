//
//  TagView.m
//  标签
//
//  Created by 武怀安 on 15/11/9.
//  Copyright © 2015年 HuaianWu. All rights reserved.
//

#import "HATwinklingTagView.h"
#import "TwinkleView.h"


@interface HATwinklingTagView ()
{
    NSMutableDictionary *_attrsDic;
}

@end
@implementation HATwinklingTagView


-(instancetype)initWithWithArray:(NSArray *)array andPoint:(CGPoint)point{
    
    self = [super init];
    if (self) {
        _array=array;
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(point.x , point.y,320, 80);
        _twinkleView = [[TwinkleView alloc]initWithFrame: CGRectMake(0, 0, 320, 80)];
        [_twinkleView setBackgroundColor:[UIColor clearColor]];
        self.backgroundColor = [UIColor clearColor];
        self.color = [UIColor whiteColor];
        [self addSubview:_twinkleView];
        //tag文字属性字典
        _attrsDic = [NSMutableDictionary dictionary];
        _attrsDic[NSForegroundColorAttributeName] = self.color;
        _attrsDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        NSShadow *shadow = [[NSShadow alloc]init];
        shadow.shadowBlurRadius = 5;
        shadow.shadowColor = [UIColor blackColor];
        shadow.shadowOffset = CGSizeMake(1, 1);
        _attrsDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        _attrsDic[NSShadowAttributeName] =shadow;
        _attrsDic[NSVerticalGlyphFormAttributeName] = @(0);

        //帧动画
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath=@"transform.scale";
        anim.values = @[@(1.0),@(4.0),@(8.0),@(4.0),@(1.0),@(4.0),@(8.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0)];
        anim.duration = 2;
        anim.repeatCount = MAXFLOAT;
        [self.twinkleView.layer addAnimation:anim forKey:nil];
    }
    return self;

}
-(void)drawRect:(CGRect)rect{
    
    switch (self.array.count) {
        case 4:
            [self drawFourthTag];
        case 3:
            [self drawThirdTag];
        case 2:
            [self drawSecondTag];
        case 1:
            [self drawFirstTag];
            break;
        case 0:
            NSLog(@"数组不能为空");
            [self removeFromSuperview];
            break;
        default:
            [self removeFromSuperview];
            break;
    }
    
}

-(void)drawFirstTag{
    
    //1.算文字尺寸
    CGSize textSize = [self calculateTextSize:_array[0]];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.color set];
    CGContextAddArc(ctx, 160, 40, 5, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    [self.color set];
    CGContextMoveToPoint(ctx, 160, 40);
    CGContextAddLineToPoint(ctx, 135, 15);
    CGContextSetLineWidth(ctx,1.5);
    CGContextAddLineToPoint(ctx, 135-textSize.width, 15);
    CGContextStrokePath(ctx);
    // 2.画矩形
    [[UIColor clearColor]set];
    CGRect cubeRect = CGRectMake(135-textSize.width, 0, textSize.width, 14);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    // 4.画文字
    [_array[0] drawInRect:cubeRect withAttributes:_attrsDic];
}

-(void)drawSecondTag{
    
    //1.算文字尺寸
    CGSize textSize = [self calculateTextSize:_array[1]];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.color set];
    CGContextSetLineWidth(ctx, 1.5);
    CGContextMoveToPoint(ctx, 160, 40);
    CGContextAddLineToPoint(ctx, 135, 65);
    CGContextAddLineToPoint(ctx, 135-textSize.width, 65);
    CGContextStrokePath(ctx);
    // 2.画矩形
    [[UIColor clearColor]set];
    CGRect cubeRect = CGRectMake(135-textSize.width, 50, textSize.width, 14);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    // 4.画文字
    [_array[1] drawInRect:cubeRect withAttributes:_attrsDic];

}

-(void)drawThirdTag{
    
    // 1.计算文字尺寸
    CGSize textSize = [self calculateTextSize:_array[2]];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.color set];
    CGContextMoveToPoint(ctx, 160, 40);
    CGContextAddLineToPoint(ctx, 185, 15);
    CGContextAddLineToPoint(ctx, 185+textSize.width, 15);
    CGContextStrokePath(ctx);
    // 2.画矩形
    [[UIColor clearColor]set];
    CGRect cubeRect = CGRectMake(185, 0,textSize.width , 14);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    // 4.画文字
    [_array[2] drawInRect:cubeRect withAttributes:_attrsDic];
}
-(void)drawFourthTag{
    
    //1.计算文字尺寸
    CGSize textSize = [self calculateTextSize:_array[3]];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.color set];
    CGContextMoveToPoint(ctx, 160, 40);
    CGContextAddLineToPoint(ctx, 185, 65);
    CGContextAddLineToPoint(ctx, 185+textSize.width, 65);
    CGContextStrokePath(ctx);
    // 2.画矩形
    [[UIColor clearColor]set];
    CGRect cubeRect = CGRectMake(185, 50, textSize.width, 14);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    // 4.画文字
    [_array[3] drawInRect:cubeRect withAttributes:_attrsDic];
}

//计算文字尺寸
- (CGSize)calculateTextSize:(NSString *)str{
   CGSize textSize = [str boundingRectWithSize:CGSizeMake(MAXFLOAT,14 ) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:_attrsDic context:nil].size;
    return textSize;
}


@end
