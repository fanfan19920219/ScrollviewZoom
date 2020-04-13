////
////  LineViewController.m
////  NewMedSci
////
////  Created by M-SJ077 on 16/7/6.
////  Copyright © 2016年 MedSci. All rights reserved.
////
//
//#import "LineViewController.h"
//#import "LineView.h"
//#import "LineDataModel.h"
//
//
//#define MAXVALUE  @"0"
//#define MINVALUE @"999"
//
//
//
//@interface LineViewController ()
//
//@property (nonatomic , strong)NSMutableArray *hitRatemodelArray;
//
//@property (nonatomic , strong)NSMutableArray *if_grapthArray;
//
//@property (nonatomic , strong)NSMutableArray  *review_grapthArray;
//
//@property (nonatomic , strong)LineView *hitRateLineView;
//
//@property (nonatomic , strong)LineView *if_LineView;
//
//@property (nonatomic , strong)LineView *review_LineView;
//
//@property (nonatomic , strong)NSString *hitRateMaxValue,*hitRateMinValue;
//
//@property (nonatomic ,strong)NSString *ifMaxValue,*ifMinvalue;
//
//@property (nonatomic , strong)NSString *reviewMaxValue,*reviewMinValue;
//
//@property (nonatomic , strong)UIScrollView *backScrollview;
//
//@end
//
//@implementation LineViewController
////
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    // Do any additional setup after loading the view.
//    
//    
//    [self getdata];
//    [self create_Views];
//    
//    [Tool initWithNavViewWith:@"历史曲线"  selfView:self];
//    self.view.backgroundColor = [UIColor whiteColor];
//}
//
//
//-(void)getdata {
//    _hitRatemodelArray = [[NSMutableArray alloc]init];
//    _if_grapthArray = [[NSMutableArray alloc]init];
//    _review_grapthArray = [[NSMutableArray alloc]init];
//    
//    NSString *urlString = [NSString stringWithFormat:@"http://api.center.medsci.cn/medsci-journal/journal-graph?jid=%@",self.jid];
//    
//    [[MyRequest defaultRequest]getRequestWithTheType:urlString theContent:nil callBackAPI:NO successBlock:^(id obj) {
//        @try {
//            NSLog(@"obj ----- %@",obj);
//            //第一个图 命中率
//            NSDictionary *hitRateDic = [[obj objectForKey:@"result"] objectForKey:@"hitRate"];
//            NSArray *hitRateArray = [hitRateDic objectForKey:@"keys"];
//            NSArray *valuesArray = [hitRateDic objectForKey:@"values"];
//            NSArray *hit_compareArray = [valuesArray subarrayWithRange : NSMakeRange ( valuesArray.count -5,5)];
//            //NSLog(@"compary array --- %@",hit_compareArray);
//            _hitRateMinValue = MINVALUE;
//            _hitRateMaxValue = MAXVALUE;
//            for(NSString *valueString in hit_compareArray){
//                if([valueString floatValue]>[_hitRateMaxValue floatValue]){
//                    _hitRateMaxValue = valueString;
//                }
//                if([valueString floatValue]<[_hitRateMinValue floatValue]){
//                    _hitRateMinValue = valueString;
//                }
//            }
//            //NSLog(@"maxValue -------- %@    minValue ------- %@",_hitRateMaxValue,_hitRateMinValue);
//            for(NSString * keyString in hitRateArray){
//                NSInteger valueindex = [hitRateArray indexOfObject:keyString];
//                NSString *valueString = [valuesArray objectAtIndex:valueindex];
//                LineDataModel *linemodel = [[LineDataModel alloc]init];
//                linemodel.xValue = keyString;
//                linemodel.yValue = valueString;
//                [_hitRatemodelArray addObject:linemodel];
//            }
//            NSInteger maxIndex1 = _hitRatemodelArray.count -1;
//            _hitRatemodelArray = (NSMutableArray*)[ _hitRatemodelArray subarrayWithRange : NSMakeRange ( maxIndex1 -4,5)];
//            // 把获取的model传进来 并且 传进来已经计算好的最大值和最小值
//            [_hitRateLineView setPointValue:_hitRatemodelArray andMaxValue:_hitRateMaxValue andMinValue:_hitRateMinValue andTitleString:@"命中率"];
//            
//            
//            //第二个图   IF指数
//            NSDictionary *if_RateDic = [[obj objectForKey:@"result"] objectForKey:@"if_grapth"];
//            NSArray *if_RateArray   = [if_RateDic objectForKey:@"keys"];
//            NSArray *if_valuesArray = [if_RateDic objectForKey:@"values"];
//            //NSArray *if_compareArray = [[if_valuesArray subarrayWithRange : NSMakeRange ( if_valuesArray.count -5,5)] sortedArrayUsingSelector:@selector(compare:)];
//            NSArray *if_compareArray = [if_valuesArray subarrayWithRange : NSMakeRange ( if_valuesArray.count -5,5)];
//            //NSLog(@"if -==---- compary array --- %@",if_compareArray);
//            _ifMinvalue = MINVALUE;
//            _ifMaxValue = MAXVALUE;
//            for(NSString *valueString in if_compareArray){
//                if([valueString floatValue]>=[_ifMaxValue floatValue]){
//                    _ifMaxValue = valueString;
//                }
//                if([valueString floatValue]<=[_ifMinvalue floatValue]){
//                    _ifMinvalue = valueString;
//                }
//            }
//
//            //NSLog(@"maxValue -------- %@    minValue ------- %@",_hitRateMaxValue,_hitRateMinValue);
//            for(NSString * keyString in if_RateArray){
//                NSInteger valueindex = [if_RateArray indexOfObject:keyString];
//                NSString *valueString = [if_valuesArray objectAtIndex:valueindex];
//                LineDataModel *linemodel = [[LineDataModel alloc]init];
//                linemodel.xValue = keyString;
//                linemodel.yValue = valueString;
//                [_if_grapthArray addObject:linemodel];
//            }
//            NSInteger maxIndex2 = _if_grapthArray.count -1;
//            _if_grapthArray = (NSMutableArray*)[ _if_grapthArray subarrayWithRange : NSMakeRange ( maxIndex2 -4,5)];
//            [_if_LineView setPointValue:_if_grapthArray andMaxValue:_ifMaxValue andMinValue:_ifMinvalue andTitleString:@"IF指数"];
//            
//            //第三个图  一审周期
//            NSDictionary *review_RateDic = [[obj objectForKey:@"result"] objectForKey:@"review_grapth"];
//            NSArray *review_RateArray = [review_RateDic objectForKey:@"keys"];
//            NSArray *review_valuesArray = [review_RateDic objectForKey:@"values"];
//            NSArray *review_compareArray = [review_valuesArray subarrayWithRange : NSMakeRange ( review_valuesArray.count -5,5)];
//            //NSLog(@"if -==---- compary array --- %@",if_compareArray);
//            _reviewMinValue = MINVALUE;
//            _reviewMaxValue = MAXVALUE;
//            for(NSString *valueString in review_compareArray){
//                if([valueString floatValue]>=[_reviewMaxValue floatValue]){
//                    _reviewMaxValue = valueString;
//                }
//                if([valueString floatValue]<=[_reviewMinValue floatValue]){
//                    _reviewMinValue = valueString;
//                }
//            }
//
//            for(NSString * keyString in review_RateArray){
//                NSInteger valueindex = [review_RateArray indexOfObject:keyString];
//                NSString *valueString = [review_valuesArray objectAtIndex:valueindex];
//                LineDataModel *linemodel = [[LineDataModel alloc]init];
//                linemodel.xValue = keyString;
//                linemodel.yValue = valueString;
//                [_review_grapthArray addObject:linemodel];
//            }
//            NSInteger maxIndex3 = _review_grapthArray.count -1;
//            _review_grapthArray = (NSMutableArray*)[ _review_grapthArray subarrayWithRange : NSMakeRange ( maxIndex3 -4,5)];
//            [_review_LineView setPointValue:_review_grapthArray andMaxValue:_reviewMaxValue andMinValue:_reviewMinValue andTitleString:@"一审周期"];
//            
//        } @catch (NSException *exception) {
//            
//        } @finally {
//            
//        }
//    } failureBlock:^(NSString *error, id obj) {
//        
//    }];
//}
//
//-(void)create_Views {
//    
//    _backScrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
//    _backScrollview.contentSize = CGSizeMake(0, VIEW_HEIGHT*1.5 + 150);
//    [self.view addSubview:_backScrollview];
//    
//    _hitRateLineView = [[LineView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT/2 + 40)];
//    [_backScrollview addSubview:_hitRateLineView];
//    
//    _if_LineView =[[LineView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT/2+ 20 + 30, VIEW_WIDTH, VIEW_HEIGHT/2+ 40)];
//    [_backScrollview addSubview:_if_LineView];
//    
//    _review_LineView = [[LineView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT + 100, VIEW_WIDTH, VIEW_HEIGHT/2+ 40)];
//    [_backScrollview addSubview:_review_LineView];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
