//
//  backGroundLayer.m
//  Sci_Line
//
//  Created by M-SJ077 on 16/7/5.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "backGroundLayer.h"
#import "LineDataModel.h"
#define isIPHONE4S ([UIScreen mainScreen].bounds.size.height == 480.0)
#define isIPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define isIPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.0)
#define isIPHONE6P ([UIScreen mainScreen].bounds.size.height == 736.0)
#define isIPADAIR ([UIScreen mainScreen].bounds.size.height == 1024.0)

//#define SPACE 30.f *_width_scale
//#define ZERO_Y 280 - 20
//#define MAX_Y_HEIGHT 50
//#define SHOW_HEIGHT 180


@interface backGroundLayer (){
    CGFloat SPACE;
    CGFloat ZERO_Y;
    CGFloat MAX_Y_HEIGHT;
    CGFloat SHOW_HEIGHT;
    CGFloat POINT_SPACE;
    
}
//初始状态
@property (nonatomic , strong)UIBezierPath *Initpath;
//暂时没有用
@property (nonatomic , strong)UIBezierPath *animationPath;
//当前的路径
@property (nonatomic , strong)UIBezierPath *currentPath;
//当前曲线传进来的 最大值 最小值
@property (nonatomic , strong)NSString *maxValue,*minValue;

@property (nonatomic , strong)UIBezierPath *starPoint;

@property (nonatomic , strong)NSMutableArray *animationPathArray;

@property (nonatomic , assign)CGFloat width_scale,height_scale;



@end

//
static const NSTimeInterval KAnimationDuration = 0.5;
//
static const NSTimeInterval KAnimationBeginTime = 0.0;
@implementation backGroundLayer

- (instancetype)init{
    if (self == [super init]) {
        self.fillColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
        self.strokeColor = [UIColor colorWithHexString:@"#2388ed"].CGColor;
        self.path = self.Initpath.CGPath;
        self.lineWidth = 1.1f;
        
        _width_scale = [UIScreen mainScreen].bounds.size.width/375;
        _height_scale = [UIScreen mainScreen].bounds.size.width/667;
        [self suatibleSize];
    }
    return self;
}


-(void)suatibleSize{
    
    SPACE = 30.f;
    ZERO_Y = 318;
    MAX_Y_HEIGHT = 50;
    SHOW_HEIGHT = 180;
    POINT_SPACE = 60;
    
    
    if(isIPADAIR){
        SPACE = 70.f;
        ZERO_Y = 498;
        MAX_Y_HEIGHT = 50;
        SHOW_HEIGHT = 180;
        POINT_SPACE = 120;
    }
    
    if(isIPHONE4S){
        SPACE = 14.f;
        ZERO_Y = 225;
        MAX_Y_HEIGHT = 50;
        SHOW_HEIGHT = 180;
        POINT_SPACE = 50;
    }
    
    
    if(isIPHONE6P){
        SPACE = 30.f;
        ZERO_Y = 350;
        MAX_Y_HEIGHT = 50;
        SHOW_HEIGHT = 180;
        POINT_SPACE = 67;
    }
    
    if(isIPHONE6){
        SPACE = 30.f;
        ZERO_Y = 318;
        MAX_Y_HEIGHT = 50;
        SHOW_HEIGHT = 180;
        POINT_SPACE = 58;
    }
    
    if(isIPHONE5){
        SPACE = 14;
        ZERO_Y = 268;
        MAX_Y_HEIGHT = 50;
        SHOW_HEIGHT = 180;
        POINT_SPACE = 50;
    }
    
}

-(UIBezierPath *)Initpath{
    if(!_Initpath){
        _Initpath = [UIBezierPath bezierPath];
        _Initpath.lineCapStyle = kCGLineCapRound;  //线条拐角
        _Initpath.lineJoinStyle = kCGLineCapRound;  //终点处理
        //1
        [_Initpath moveToPoint:CGPointMake(SPACE + 30, 150)];
        [_Initpath addArcWithCenter:CGPointMake(SPACE + 30, 150) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        //2
//        [_Initpath addLineToPoint:CGPointMake(SPACE + 90, 150)];
//        [_Initpath addArcWithCenter:CGPointMake(SPACE + 90, 150) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
//        //3
//        [_Initpath addLineToPoint:CGPointMake(SPACE + 150, 270)];
//        [_Initpath addArcWithCenter:CGPointMake(SPACE + 150, 270) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
//        //4
//        [_Initpath addLineToPoint:CGPointMake(SPACE + 210, 70)];
//        [_Initpath addArcWithCenter:CGPointMake(SPACE + 210, 70) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
//        //5
//        [_Initpath addLineToPoint:CGPointMake(SPACE + 270, 220)];
//        [_Initpath addArcWithCenter:CGPointMake(SPACE + 270, 220) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        
        [_Initpath setLineWidth:1];
        [_Initpath stroke];
    }
    return _Initpath;
}

-(UIBezierPath*)animationPath{
    if(!_animationPath){
        _animationPath = [UIBezierPath bezierPath];
        _animationPath.lineCapStyle = kCGLineCapRound;  //线条拐角
        _animationPath.lineJoinStyle = kCGLineCapRound;  //终点处理
        //1
        [_animationPath moveToPoint:CGPointMake(SPACE + 30, 150)];
        [_animationPath addArcWithCenter:CGPointMake(SPACE + 30, 150) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        //2
        [_animationPath addLineToPoint:CGPointMake(SPACE + 90, 150)];
        [_animationPath addArcWithCenter:CGPointMake(SPACE + 90, 150) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        //3
        [_animationPath addLineToPoint:CGPointMake(SPACE + 150, 280)];
        [_animationPath addArcWithCenter:CGPointMake(SPACE + 150, 280) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        //4
        [_animationPath addLineToPoint:CGPointMake(SPACE + 210, 50)];
        [_animationPath addArcWithCenter:CGPointMake(SPACE + 210, 50) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        //5
        [_animationPath addLineToPoint:CGPointMake(SPACE + 250, 220)];
        [_animationPath addArcWithCenter:CGPointMake(SPACE + 250, 220) radius:2 startAngle:0 endAngle:2*M_PI clockwise:1];
        
        //    line1.lineCapStyle = kCGLineCapButt;  //线条拐角
        //    line1.lineJoinStyle = kCGLineCapButt;  //终点处理
        [_animationPath setLineWidth:1];
        [_animationPath stroke];
        NSLog(@"3--23");
    }
    return _animationPath;
}


-(UIBezierPath*)currentPath{
    @try {
        if(!_currentPath){
            //放置动画路径的数组
            _animationPathArray = [[NSMutableArray alloc]init];
            _currentPath = [UIBezierPath bezierPath];
            _currentPath.lineCapStyle = kCGLineCapRound;  //线条拐角
            _currentPath.lineJoinStyle = kCGLineCapRound;  //终点处理
            for(LineDataModel *model in self.pointArray){
                NSInteger xIndex = [self.pointArray indexOfObject:model];
                if(xIndex==0){
                    [_currentPath moveToPoint:CGPointMake(SPACE + 50+  POINT_SPACE*(xIndex ), ZERO_Y - ((([model.yValue floatValue] - [self.minValue floatValue])/([self.maxValue floatValue]- [self.minValue floatValue]))*SHOW_HEIGHT))];
                    [_currentPath addLineToPoint:CGPointMake(SPACE + 50+ POINT_SPACE*(xIndex ), ZERO_Y - ((([model.yValue floatValue] - [self.minValue floatValue])/([self.maxValue floatValue]- [self.minValue floatValue]))*SHOW_HEIGHT))];
                    UIBezierPath* currentpath = [[UIBezierPath alloc]init];
                    currentpath.CGPath = _currentPath.CGPath;
                    [_animationPathArray addObject:currentpath];
                }else{
//                    UIBezierPath* oldpath = [[UIBezierPath alloc]init];
//                    oldpath.CGPath = _currentPath.CGPath;
                    [_currentPath addLineToPoint:CGPointMake(SPACE + 50 +POINT_SPACE*(xIndex ), ZERO_Y - ((([model.yValue floatValue] - [self.minValue floatValue])/([self.maxValue floatValue]- [self.minValue floatValue]))*SHOW_HEIGHT))];
                    UIBezierPath *newPath = [[UIBezierPath alloc]init];
                    newPath.CGPath = _currentPath.CGPath;
                    [_animationPathArray addObject:newPath];
                    
                    //NSLog(@"copyPath --- %@   --- path1 ----- %@",_currentPath,path1);
                    
                }
                //            NSLog(@"x --- %f ---- y ---- %f",SPACE + 30 + 60*(xIndex -1),(([model.yValue floatValue] - [self.minValue floatValue])/([self.maxValue floatValue]- [self.minValue floatValue])));
                //NSLog(@"model.Value ---%@ --- minValue --- %@",model.yValue,self.minValue);
            }
            [_currentPath setLineWidth:1];
            [_currentPath stroke];
        }
        return nil;
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}



- (void)triangleAnimate {
    //    left
    CABasicAnimation *triangleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationLeft.fromValue = (__bridge id _Nullable)(self.Initpath.CGPath);
    triangleAnimationLeft.toValue = (__bridge id _Nullable)(self.animationPath.CGPath);
    triangleAnimationLeft.duration = 4;
    triangleAnimationLeft.fillMode = kCAFillModeForwards;
    triangleAnimationLeft.removedOnCompletion = NO;
    [self addAnimation:triangleAnimationLeft forKey:nil];
}

-(void)refreshPoint:(NSMutableArray *)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue{
    //要画曲线的点数组
    self.pointArray = pointArray;
    //最大值最小值
    self.maxValue = maxValue;
    self.minValue  = minValue;
    //NSLog(@"self.maxValue ----- %@   self.minValue ---- %@",self.maxValue , self.minValue);
    //画出点
    self.path = self.currentPath.CGPath;
    [self drawPointLine];
}

-(void)drawPointLine{
    NSMutableArray *animationArray = [[NSMutableArray alloc]init];
    @try {
        UIBezierPath *lastPath =[[UIBezierPath alloc]init];
        lastPath.CGPath = [[_animationPathArray objectAtIndex:0] CGPath];
        for(UIBezierPath *animationPath in _animationPathArray){
            NSInteger PathIndex = [_animationPathArray indexOfObject:animationPath];
            NSLog(@"PathIndex --- %ld ---- path ----- %@",(long)PathIndex,animationPath);
//            if(PathIndex !=0){
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
                animation.fromValue = (__bridge id _Nullable)(lastPath.CGPath);
//            if(PathIndex ==0){
//                UIBezierPath *nextPath = [_animationPathArray objectAtIndex:PathIndex+1];
//                animation.toValue = (__bridge id _Nullable)(nextPath.CGPath);
//            }else{
                animation.toValue = (__bridge id _Nullable)(animationPath.CGPath);
//            }
                //animation.toValue = (__bridge id _Nullable)(animationPath.CGPath);
                animation.beginTime = KAnimationDuration *(PathIndex);
                animation.duration = KAnimationDuration;
                [animationArray addObject:animation];
            lastPath.CGPath = animationPath.CGPath;
//            }
        }
        //开始执行动画
        CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
        animationGroup.animations = (NSArray*)animationArray;
        animationGroup.duration = animationArray.count * KAnimationDuration;
        //animationGroup.repeatCount = 2;
        animationGroup.fillMode = kCAFillModeForwards;
        animationGroup.removedOnCompletion = NO;
        [self addAnimation:animationGroup forKey:nil];
        NSLog(@"animation group ---- %@",animationArray);
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }

}

@end
