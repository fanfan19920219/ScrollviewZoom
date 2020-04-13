//
//  LineView.m
//  Sci_Line
//
//  Created by M-SJ077 on 16/7/5.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "LineView.h"
#import "backGroundLayer.h"
#import "PointLayer.h"
#import "UIColor+Hex.h"
#import "LineDataModel.h"
//点边距
//#define POINT_SPACE 30.f

// 边距
#define SPACE 45.f
// 线间距
#define LINE_SPACE  55.f
// 线颜色
#define LINECOLOR [UIColor colorWithHexString:@"#b9b9b9"].CGColor
// Y坐标颜色
#define YEAR_TEXT_COLOR [UIColor colorWithHexString:@"#333333"].CGColor
// 横坐标每一格的宽度
//#define YEARTAG_WDITH (self.frame.size.width - LINE_SPACE *2 - 30)/4.f
// 标注宽度
#define HEIGHT_TAG_WIDTH 25
// 标注高度
#define HEIGHT_TAG_HEIGHT 15
// 主标题宽度
#define TITLE_WIDTH  100.f
// 0点坐标高度
#define ZERO_Y (self.frame.size.height - 1 - LINE_SPACE)

//#define POINT_ZERO_Y 280
//
#define MAX_Y_HEIGHT LINE_SPACE*4

#define SHOW_HEIGHT 180

@interface LineView (){
    
    CGFloat  POINT_SPACE;         // 左边距
    
    CGFloat  POINT_ZERO_Y;       // 0坐标线
       
    CGFloat  POINT_LINE_SPACE; //  点间距
    
    CGFloat  TITLE_HEIGHT;         //TITLE 高度
    
    CGFloat  TITLE_FRAME_Y;       //title的y 坐标
    
    CGFloat YEARTAG_WDITH;       //横坐标每一格的宽度
}

@property (nonatomic , strong)backGroundLayer *lineLayer;
// 暂时没用
@property (nonatomic , strong)PointLayer *pointLayer;
// 横线
@property (nonatomic , strong)CALayer *line0,*line1,*line2,*line3,*line4;
// 年份
@property (nonatomic , strong)CATextLayer *yeartag0,*yeartag1,*yeartag2,*yeartag3,*yeartag4,*yeartag5,*yeartag6;
// 高度标志
@property (nonatomic , strong)CATextLayer *heightTag0,*heightTag1,*heightTag2,*heightTag3,*heightTag4;
// titleLayer
@property (nonatomic , strong)CATextLayer *TitleLayer;
// 线间距
@property (nonatomic , assign)CGFloat *maxLineheight,*minLineheight,*LineSpace;
// 防止点的数组
@property (nonatomic , strong)NSMutableArray *pointButtonArray;

@end

@implementation LineView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        [self suatibleSize];
        [self addBackGroundView];
        [self create_heightLine];
        [self create_yearTags];
        [self create_heightTags];
        
    }
    return self;
}

// 创建横线
-(void)create_heightLine{
    self.line0 = [CALayer layer];
    self.line0.frame = CGRectMake(SPACE, self.frame.size.height - 1 - LINE_SPACE, self.frame.size.width - 2 * SPACE +10, 1);
    self.line0.backgroundColor = LINECOLOR;
    [self.layer addSublayer:self.line0];
    
    self.line1 = [CALayer layer];
    self.line1.frame = CGRectMake(SPACE, self.frame.size.height - 2 - LINE_SPACE*2, self.frame.size.width - 2 * SPACE +10, 1);
    self.line1.backgroundColor = LINECOLOR;
    [self.layer addSublayer:self.line1];
    
    self.line2 = [CALayer layer];
    self.line2.frame = CGRectMake(SPACE, self.frame.size.height - 3 - LINE_SPACE*3, self.frame.size.width - 2 * SPACE + 10, 1);
    self.line2.backgroundColor = LINECOLOR;
    [self.layer addSublayer:self.line2];
    
    self.line3 = [CALayer layer];
    self.line3.frame = CGRectMake(SPACE, self.frame.size.height - 4 - LINE_SPACE*4, self.frame.size.width - 2 * SPACE + 10, 1);
    self.line3.backgroundColor = LINECOLOR;
    [self.layer addSublayer:self.line3];
    
    self.line4 = [CALayer layer];
    self.line4.frame = CGRectMake(SPACE, self.frame.size.height - 5 - LINE_SPACE*5, self.frame.size.width - 2 * SPACE + 10, 1);
    self.line4.backgroundColor = LINECOLOR;
    [self.layer addSublayer:self.line4];

}


// 创建折线(非background)
-(void)addBackGroundView{
    [self.layer addSublayer:self.backLayer];
    //[self.layer addSublayer:self.pointLayer];
}

-(backGroundLayer *)backLayer{
    if(!_lineLayer){
        _lineLayer = [[backGroundLayer alloc]init];
    }
    return _lineLayer;
}

-(PointLayer *)pointLayer{
    if(!_pointLayer){
        _pointLayer = [[PointLayer alloc]init];
    }
    return _pointLayer;
}

// 创建年标注   横坐标
-(void)create_yearTags{
    _yeartag0 = [CATextLayer layer];
    _yeartag0.string = @"2012";
    _yeartag0.frame = CGRectMake(SPACE , self.frame.size.height - 1 - LINE_SPACE + 5, YEARTAG_WDITH, 15);
    _yeartag0.fontSize = 13.f;
    _yeartag0.alignmentMode = kCAAlignmentCenter;
    _yeartag0.foregroundColor =YEAR_TEXT_COLOR;
    //_yeartag0.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_yeartag0];
    //分割 1
    CALayer *separate0 = [CALayer layer];
    separate0.backgroundColor =YEAR_TEXT_COLOR;
    separate0.frame = CGRectMake(SPACE + YEARTAG_WDITH, self.frame.size.height - 1 - LINE_SPACE + 2, 1, 5);
    [self.layer addSublayer:separate0];
    
    _yeartag1 = [CATextLayer layer];
    _yeartag1.string = @"2013";
    _yeartag1.frame = CGRectMake(YEARTAG_WDITH +SPACE , self.frame.size.height - 1 - LINE_SPACE + 5, YEARTAG_WDITH, 15);
    _yeartag1.fontSize = 13.f;
    _yeartag1.alignmentMode = kCAAlignmentCenter;
    _yeartag1.foregroundColor =YEAR_TEXT_COLOR;
    //_yeartag1.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_yeartag1];
    //分割2
    CALayer *separate1 = [CALayer layer];
    separate1.backgroundColor =YEAR_TEXT_COLOR;
    separate1.frame = CGRectMake(SPACE + YEARTAG_WDITH*2, self.frame.size.height - 1 - LINE_SPACE + 2, 1, 5);
    [self.layer addSublayer:separate1];
    
    _yeartag2 = [CATextLayer layer];
    _yeartag2.string = @"2014";
    _yeartag2.frame = CGRectMake(YEARTAG_WDITH*2 + SPACE , self.frame.size.height - 1 - LINE_SPACE + 5, YEARTAG_WDITH, 15);
    _yeartag2.fontSize = 13.f;
    _yeartag2.alignmentMode = kCAAlignmentCenter;
    _yeartag2.foregroundColor =YEAR_TEXT_COLOR;
    //_yeartag2.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_yeartag2];
    //分割3
    CALayer *separate2 = [CALayer layer];
    separate2.backgroundColor =YEAR_TEXT_COLOR;
    separate2.frame = CGRectMake(SPACE + YEARTAG_WDITH*3, self.frame.size.height - 1 - LINE_SPACE + 2, 1, 5);
    [self.layer addSublayer:separate2];
    
    _yeartag3 = [CATextLayer layer];
    _yeartag3.string = @"2015";
    _yeartag3.frame = CGRectMake(YEARTAG_WDITH*3 + SPACE , self.frame.size.height - 1 - LINE_SPACE + 5, YEARTAG_WDITH, 15);
    _yeartag3.fontSize = 13.f;
    _yeartag3.alignmentMode = kCAAlignmentCenter;
    _yeartag3.foregroundColor =YEAR_TEXT_COLOR;
    //_yeartag3.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_yeartag3];
    //分割4
    CALayer *separate3 = [CALayer layer];
    separate3.backgroundColor =YEAR_TEXT_COLOR;
    separate3.frame = CGRectMake(SPACE + YEARTAG_WDITH*4, self.frame.size.height - 1 - LINE_SPACE + 2, 1, 5);
    [self.layer addSublayer:separate3];
    
    _yeartag4 = [CATextLayer layer];
    _yeartag4.string = @"2016";
    _yeartag4.frame = CGRectMake(YEARTAG_WDITH*4+ SPACE , self.frame.size.height - 1 - LINE_SPACE + 5, YEARTAG_WDITH, 15);
    _yeartag4.fontSize = 13.f;
    _yeartag4.alignmentMode = kCAAlignmentCenter;
    _yeartag4.foregroundColor =YEAR_TEXT_COLOR;
    [self.layer addSublayer:_yeartag4];
    
    UILabel *introductLabel = [[UILabel alloc]initWithFrame:CGRectMake(SPACE - 5, self.frame.size.height - 1 - LINE_SPACE + 23, self.frame.size.width - SPACE*2 + 10, 38)];
    introductLabel.textColor =[UIColor colorWithHexString:@"#999999"];
    introductLabel.font = [UIFont systemFontOfSize:12  weight:0.001];
    introductLabel.text = @"根据梅斯医学海量会员提供的投稿一审周期数据分析的实时动态曲线。";
    introductLabel.numberOfLines = 0;
    [self addSubview:introductLabel];
}

// 创建高度坐标
-(void)create_heightTags{
    self.heightTag0 = [CATextLayer layer];
    self.heightTag0.frame = CGRectMake(15, self.frame.size.height - 1 - LINE_SPACE -10, HEIGHT_TAG_WIDTH, HEIGHT_TAG_HEIGHT);
    self.heightTag0.string = @"-2";
    self.heightTag0.foregroundColor = [UIColor grayColor].CGColor;
    self.heightTag0.fontSize = 13;
    self.heightTag0.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:self.heightTag0];
    
    self.heightTag1 = [CATextLayer layer];
    self.heightTag1.frame = CGRectMake(15, self.frame.size.height - 1 - LINE_SPACE*2-10, HEIGHT_TAG_WIDTH, HEIGHT_TAG_HEIGHT);
    self.heightTag1.string = @"0";
    self.heightTag1.foregroundColor = [UIColor grayColor].CGColor;
    self.heightTag1.fontSize = 13;
    self.heightTag1.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:self.heightTag1];
    
    self.heightTag2 = [CATextLayer layer];
    self.heightTag2.frame = CGRectMake(15, self.frame.size.height - 1 - LINE_SPACE*3-10, HEIGHT_TAG_WIDTH, HEIGHT_TAG_HEIGHT);
    self.heightTag2.string = @"2";
    self.heightTag2.foregroundColor = [UIColor grayColor].CGColor;
    self.heightTag2.fontSize = 13;
    self.heightTag2.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:self.heightTag2];
    
    self.heightTag3 = [CATextLayer layer];
    self.heightTag3.frame = CGRectMake(15, self.frame.size.height - 1 - LINE_SPACE*4-10, HEIGHT_TAG_WIDTH, HEIGHT_TAG_HEIGHT);
    self.heightTag3.string = @"4";
    self.heightTag3.foregroundColor = [UIColor grayColor].CGColor;
    self.heightTag3.fontSize = 13;
    self.heightTag3.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:self.heightTag3];
    
    self.heightTag4 = [CATextLayer layer];
    self.heightTag4.frame = CGRectMake(15, self.frame.size.height - 1 - LINE_SPACE*5-10, HEIGHT_TAG_WIDTH, HEIGHT_TAG_HEIGHT);
    self.heightTag4.string = @"6";
    self.heightTag4.foregroundColor = [UIColor grayColor].CGColor;
    self.heightTag4.fontSize = 13;
    self.heightTag4.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:self.heightTag4];
    
    self.TitleLayer = [CATextLayer layer];
    self.TitleLayer.frame = CGRectMake(15 , TITLE_FRAME_Y, TITLE_WIDTH, TITLE_HEIGHT);
    self.TitleLayer.fontSize = 15;
    self.TitleLayer.alignmentMode = kCAAlignmentLeft;
    self.TitleLayer.foregroundColor = [UIColor grayColor].CGColor;
    self.TitleLayer.string = @"IF曲线";
    //文字背景颜色
    CALayer *titlebackLayer = [CALayer layer];
    titlebackLayer.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"].CGColor;
    titlebackLayer.frame = CGRectMake(0, 0, self.frame.size.width, TITLE_HEIGHT);
    [self.layer addSublayer:titlebackLayer];
    [self.layer addSublayer:self.TitleLayer];
}

-(void)animation{
    [self.backLayer triangleAnimate];
}

-(void)setPointValue:(NSMutableArray*)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue andTitleString:(NSString*)titleString{
    self.TitleLayer.string = titleString;
//    [self.backLayer setPointArray:pointArray];
    //-(void)refreshPoint:(NSMutableArray *)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue
    //调用Layer的方法  画出最新的曲线
    [self.backLayer refreshPoint:pointArray andMaxValue:maxValue andMinValue:minValue];
    //设置间距的方法
    [self setLineTagsMaxValue:maxValue andMinValue:minValue];
    //调用自己的方法 画出点
    [self createPoint:pointArray andMaxValue:maxValue andMinValue:minValue];
    
}


//创建button上面的点
-(void)createPoint:(NSMutableArray *)pointArray andMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue{
    @try {
        for(LineDataModel *model in pointArray){
            NSInteger index = [pointArray indexOfObject:model];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(pointClick:) forControlEvents:UIControlEventTouchUpInside];
            button.bounds = CGRectMake(0, 0, 5, 5);
            button.layer.cornerRadius = 2.5;
            button.clipsToBounds = YES;
            button.center = CGPointMake(POINT_SPACE + 50 + POINT_LINE_SPACE*(index -1), 100);
            button.center = CGPointMake(POINT_SPACE + 50+ POINT_LINE_SPACE*index, POINT_ZERO_Y - ((([model.yValue floatValue] - [minValue floatValue])/([maxValue floatValue]- [minValue floatValue]))*SHOW_HEIGHT));
            button.backgroundColor = [UIColor colorWithHexString:@"#2388ed"];
            [self addSubview:button];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


-(void)pointClick:(UIButton*)sender{
    NSLog(@"click");
}

-(void)suatibleSize{
    POINT_SPACE = 30;
    POINT_ZERO_Y = 280;
    POINT_LINE_SPACE = 60;
    TITLE_HEIGHT = 50;
    TITLE_FRAME_Y = 20;
    YEARTAG_WDITH = (self.frame.size.width - LINE_SPACE *2 - 30)/4.f;
    /*
     SPACE = 30.f;
     ZERO_Y = 280;
     MAX_Y_HEIGHT = 50;
     SHOW_HEIGHT = 180;
     POINT_SPACE = 60;
     */
    
    if(isIPADAIR){
        YEARTAG_WDITH = (self.frame.size.width - LINE_SPACE *2 - 30)/5.f;
        POINT_SPACE = 70;
        POINT_ZERO_Y = 498;
        POINT_LINE_SPACE = 120;
        TITLE_HEIGHT = 50;
        TITLE_FRAME_Y = 20;
    }
    
    
    if(isIPHONE4S){
        POINT_SPACE = 14;
        POINT_ZERO_Y = 225;
        POINT_LINE_SPACE = 50;
        TITLE_HEIGHT = 30;
        TITLE_FRAME_Y = 5;
    }
    
    
    if(isIPHONE5){
        TITLE_FRAME_Y = 7;
        POINT_SPACE = 14;
        POINT_ZERO_Y = 268;
        POINT_LINE_SPACE = 50;
        TITLE_HEIGHT = 30;
    }
    
    if(isIPHONE6){
        POINT_SPACE = 30;
        POINT_ZERO_Y = 318;
        POINT_LINE_SPACE = 58;
    }
    
    if(isIPHONE6P){
        POINT_SPACE = 30;
        POINT_ZERO_Y = 350;
        POINT_LINE_SPACE = 67;
    }
    
//    if(isIPHONE6P){
//        SPACE = 30.f;
//        ZERO_Y = 350;
//        MAX_Y_HEIGHT = 50;
//        SHOW_HEIGHT = 180;
//        POINT_SPACE = 67;
//    }
//    
//    if(isIPHONE6){
//        SPACE = 30.f;
//        ZERO_Y = 280;
//        MAX_Y_HEIGHT = 50;
//        SHOW_HEIGHT = 180;
//        POINT_SPACE = 60;
//    }
//    
//    if(isIPHONE5){
//        SPACE = 14;
//        ZERO_Y = 268;
//        MAX_Y_HEIGHT = 50;
//        SHOW_HEIGHT = 180;
//        POINT_SPACE = 50;
//    }
    
}


// 设置间距
-(void)setLineTagsMaxValue:(NSString *)maxValue andMinValue:(NSString*)minValue{
    float space = ([maxValue floatValue] - [minValue floatValue])/4.f;
    self.heightTag0.string = [NSString stringWithFormat:@"%f",[minValue floatValue]];
    self.heightTag1.string = [NSString stringWithFormat:@"%f",[minValue floatValue] + space];
    self.heightTag2.string = [NSString stringWithFormat:@"%f",[minValue floatValue] + space *2];;
    self.heightTag3.string = [NSString stringWithFormat:@"%f",[minValue floatValue] + space *3];
    self.heightTag4.string = [NSString stringWithFormat:@"%f",[minValue floatValue] + space *4];
}



-(void)drawRect:(CGRect)rect{
    
}

@end
