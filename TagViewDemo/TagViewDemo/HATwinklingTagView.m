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


@property(nonatomic,strong)NSString *string1;
@property(nonatomic,strong)NSString *string2;
@property(nonatomic,strong)NSString *string3;
@property(nonatomic,strong)NSString *string4;

@end
@implementation HATwinklingTagView


-(instancetype)initWithWithArray:(NSArray *)array andPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        _array=array;
//        _string1 = _array[0];
//        _string2= _array[1];
//        _string3 = _array[2];
//        _string4 = _array[3];
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(point.x , point.y,320, 80);
        _twinkle = [[TwinkleView alloc]initWithFrame: CGRectMake(0, 0, 320, 80)];
        
        [_twinkle setBackgroundColor:[UIColor clearColor]];
        self.backgroundColor = [UIColor clearColor];
        self.color = [UIColor whiteColor];
        
        
        
        [self addSubview:_twinkle];
//        CABasicAnimation *scale = [CABasicAnimation animation];
//        scale.keyPath = @"transform.scale";
//        scale.toValue = @(5.0);
//        scale.duration = 1;
//        scale.repeatCount = MAXFLOAT;
//        [self.TwinkleView.layer addAnimation:scale forKey:nil];
        
        //帧动画
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        
        anim.keyPath=@"transform.scale";
        anim.values = @[@(1.0),@(4.0),@(8.0),@(4.0),@(1.0),@(4.0),@(8.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0),@(1.0)];
        
        anim.duration = 2;
        anim.repeatCount = MAXFLOAT;
        [self.twinkle.layer addAnimation:anim forKey:nil];
        
        
        
        
    }
    return self;


}
-(void)drawRect:(CGRect)rect{
    if (self.array.count ==1) {
        [self oneTag];
    }else if (self.array.count ==2){
        [self oneTag];
        [self twoTag];
    
    }else if (self.array.count ==3){
        [self oneTag];
        [self twoTag];
        [self threeTag];
    
    }else if(self.array.count ==4){
        [self oneTag];
        [self twoTag];
        [self threeTag];
        [self foreTag];
    }else if (self.array.count == 0){
        NSLog(@"数组不能为空");
        [self removeFromSuperview];
    
    }
    
   
    
    
    
    
}

-(void)oneTag{
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    
    attrs1[NSForegroundColorAttributeName] = self.color;
    attrs1[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    CGSize textSize = [_array[0] boundingRectWithSize:CGSizeMake(MAXFLOAT,14 ) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs1 context:nil].size;

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
    
    NSString *str = _array[0];
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] = self.color;
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = self.color;
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(1, 1);
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSShadowAttributeName] =shadow;
    attrs[NSVerticalGlyphFormAttributeName] = @(0);
    [str drawInRect:cubeRect withAttributes:attrs];
    CGContextAddArc(ctx, 160, 40, 9, 0, 2*M_PI, 0);
    [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2]set];
    CGContextSetLineWidth(ctx, 0.5);
    CGContextFillPath(ctx);
    
}

-(void)twoTag{
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    
    attrs1[NSForegroundColorAttributeName] = self.color;
    attrs1[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    CGSize textSize = [_array[1] boundingRectWithSize:CGSizeMake(MAXFLOAT,14 ) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs1 context:nil].size;
    
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
    NSString *str = _array[1];
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] = self.color;
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(1, 1);
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSShadowAttributeName] =shadow;
    attrs[NSVerticalGlyphFormAttributeName] = @(0);
    [str drawInRect:cubeRect withAttributes:attrs];

}

-(void)threeTag{
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    
    attrs1[NSForegroundColorAttributeName] = self.color;
    attrs1[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    CGSize textSize = [_array[2] boundingRectWithSize:CGSizeMake(MAXFLOAT,14 ) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs1 context:nil].size;
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
    NSString *str = _array[2];
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] =self.color;
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    
    paragraph.alignment = NSTextAlignmentRight;
    //attrs[NSParagraphStyleAttributeName] =paragraph;
    attrs[NSForegroundColorAttributeName] = self.color;
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(1, 1);
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSShadowAttributeName] =shadow;
   attrs[NSVerticalGlyphFormAttributeName] = @(0);
    [str drawInRect:cubeRect withAttributes:attrs];

    
    

    
}
-(void)foreTag{
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    
    attrs1[NSForegroundColorAttributeName] = self.color;
    attrs1[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    CGSize textSize = [_array[3] boundingRectWithSize:CGSizeMake(MAXFLOAT,14 ) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs1 context:nil].size;
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
    NSString *str = _array[3];
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] = self.color;
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = self.color;
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(1, 1);
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSShadowAttributeName] =shadow;
    attrs[NSVerticalGlyphFormAttributeName] = @(0);
    [str drawInRect:cubeRect withAttributes:attrs];
    

    
}
@end
