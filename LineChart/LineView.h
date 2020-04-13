//
//  LineView.h
//  Sci_Line
//
//  Created by M-SJ077 on 16/7/5.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))
//by  Box
#define isIPHONE4S ([UIScreen mainScreen].bounds.size.height == 480.0)
#define isIPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define isIPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.0)
#define isIPHONE6P ([UIScreen mainScreen].bounds.size.height == 736.0)
#define isIPADAIR ([UIScreen mainScreen].bounds.size.height == 1024.0)

@interface LineView : UIView


// 把获取的model传进来 并且 传进来已经计算好的最大值和最小值
-(void)setPointValue:(NSMutableArray*)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue andTitleString:(NSString*)titleString;

@end
