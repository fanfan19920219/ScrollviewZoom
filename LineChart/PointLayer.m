//
//  PointLayer.m
//  Sci_Line
//
//  Created by M-SJ077 on 16/7/5.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "PointLayer.h"
@interface PointLayer ()

@property (nonatomic , strong)UIBezierPath *Initpath;



@end


@implementation PointLayer

- (instancetype)init {
    
    if (self == [super init]) {
        self.fillColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
        self.strokeColor = [UIColor colorWithHexString:@"#2388ed"].CGColor;
        self.path = self.Initpath.CGPath;
        self.lineWidth = 2;
    }
    return self;
}


-(UIBezierPath *)Initpath{
    if(!_Initpath){
        _Initpath = [UIBezierPath bezierPath];
//        _Initpath.lineCapStyle = kCGLineCapSquare;  //线条拐角
//        _Initpath.lineJoinStyle = kCGLineCapSquare;  //终点处理
        
        
       // - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
        [_Initpath moveToPoint:CGPointMake(20, 300)];
        [_Initpath addArcWithCenter:CGPointMake(20, 300) radius:3 startAngle:0 endAngle:2*M_PI clockwise:1];
        
        [_Initpath addArcWithCenter:CGPointMake(100.0, 150) radius:3 startAngle:0 endAngle:2*M_PI clockwise:1];
        
//        [_Initpath addLineToPoint:CGPointMake(100.0, 150)];
//        //[line1 addLineToPoint:CGPointMake(300, 20)];
//        [_Initpath addLineToPoint:CGPointMake(130, 280)];
//        [_Initpath addLineToPoint:CGPointMake(150, 200)];
//        
//        [_Initpath addLineToPoint:CGPointMake(180, 300)];
//        
//        [_Initpath addLineToPoint:CGPointMake(210, 100)];
//        
//        [_Initpath addLineToPoint:CGPointMake(240, 230)];
//        
//        [_Initpath addLineToPoint:CGPointMake(270, 400)];
        
        //    line1.lineCapStyle = kCGLineCapButt;  //线条拐角
        //    line1.lineJoinStyle = kCGLineCapButt;  //终点处理
        [_Initpath setLineWidth:1];
        //        [[UIColor blueColor] setStroke];
        //[kCOLOR setFill];
        //[line1 fill];
        [_Initpath stroke];
        //
        //[_Initpath closePath];
    }
    return _Initpath;
}
@end
