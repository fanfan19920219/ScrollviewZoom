//
//  backGroundLayer.h
//  Sci_Line
//
//  Created by M-SJ077 on 16/7/5.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"

@interface backGroundLayer : CAShapeLayer

@property (nonatomic , strong)NSMutableArray  *pointArray;
-(void)refreshPoint:(NSMutableArray *)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue;

-(void)triangleAnimate;

@end


