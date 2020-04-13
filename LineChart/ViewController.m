//
//  ViewController.m
//  LineChart
//
//  Created by M-SJ077 on 16/7/21.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"
#import "LineDataModel.h"
#define MAXVALUE  @"0"
#define MINVALUE @"999"
@interface ViewController ()

@property (nonatomic , strong)LineView *lineView;

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.minimumZoomScale=0.5;
    self.scrollView.maximumZoomScale=6.0;
    self.scrollView.contentSize=CGSizeMake(1280, 960);
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.lineView];
    
    [self.view addSubview:self.scrollView];
//    [self.scrollView addSubview:self.imageView];
    
    
    [self create_View];
    
}

-(UIImageView*)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _imageView.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        label.text = @"我叫张志华";
//        [_imageView addSubview:label];
    }
    return _imageView;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{

    return self.lineView;
}

-(LineView*)lineView{
    if(!_lineView)
    {
        _lineView = [[LineView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height/2  + 40)];
        [self.scrollView addSubview:_lineView];
        
        NSMutableArray *modelArray = [[NSMutableArray alloc]init];
        
        for(int i = 0 ; i<5 ; i++){
            LineDataModel *model = [[LineDataModel alloc]init];
            model.xValue = [NSString stringWithFormat:@"%u",arc4random()%20];
            model.yValue = [NSString stringWithFormat:@"%u",arc4random()%20];
            [modelArray addObject:model];
        }
        [_lineView setPointValue:modelArray andMaxValue:@"20" andMinValue:@"0" andTitleString:@"IF指数"];
//        _lineView.userInteractionEnabled = NO;
    }
    return _lineView;
}

-(void)create_View{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
