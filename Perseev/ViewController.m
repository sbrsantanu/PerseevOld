//
//  ViewController.m
//  Perseev
//
//  Created by Santanu Das Adhikary on 20/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "ViewController.h"
#import "VBPieChart.h"
#import "LandingScreen.h"

@interface ViewController ()<VBPieChartProtocol>
@property (nonatomic, retain) VBPieChart *chart;
@property (nonatomic, retain) NSArray *chartValues;
@property (nonatomic, retain) UIImageView *CenterImageView;
@end

@implementation ViewController

-(void)RetunWebserviceDataWithSuccess:(VBPieChart *)DataDelegate ObjectCarrier:(NSDictionary *)ParamObjectCarrier
{
    //NSLog(@"======Param Object Carier -------- %d",[[ParamObjectCarrier objectForKey:@"PiechartSelectedObject"] intValue]-12389);
    
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:2.0f];
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"rippleEffect"];
    [_CenterImageView.layer addAnimation:animation forKey:NULL];
    
    switch ([[ParamObjectCarrier objectForKey:@"PiechartSelectedObject"] intValue]-12389) {
        case 0:
            [_CenterImageView setImage:[UIImage imageNamed:@"1cricket.jpg"]];
            break;
        case 1:
            [_CenterImageView setImage:[UIImage imageNamed:@"unnamed.png"]];
            break;
        case 2:
            [_CenterImageView setImage:[UIImage imageNamed:@"Dennis-Lilllee.jpg"]];
            break;
        case 3:
            [_CenterImageView setImage:[UIImage imageNamed:@"cricket-1.jpg"]];
            break;
        case 4:
            [_CenterImageView setImage:[UIImage imageNamed:@"sehwag-mi300.jpg"]];
            break;
        case 5:
            [_CenterImageView setImage:[UIImage imageNamed:@"Dennis-Lilllee.jpg"]];
            break;
        case 6:
            [_CenterImageView setImage:[UIImage imageNamed:@"unnamed.png"]];
            break;
        case 7:
            [_CenterImageView setImage:[UIImage imageNamed:@"sehwag-mi300.jpg"]];
            break;
    }
}

- (IBAction)valueChangedSlider:(UISlider*)sender {
    
    float value = [sender value];
    
    switch (sender.tag) {
        case 0: {
            
            // [_chart setFrame:CGRectMake(100, 100, value, value)];
            
            NSMutableArray *array = [NSMutableArray arrayWithArray:_chart.chartValues];
            NSMutableDictionary *object = [NSMutableDictionary dictionaryWithDictionary:[array objectAtIndex:sender.tag]];
            [object setObject:[NSNumber numberWithFloat:sender.value] forKey:@"value"];
            [array replaceObjectAtIndex:sender.tag withObject:object];
            _chart.chartValues = array;
            
        }
            break;
        case 1:
            [_chart setRadiusPrecent:value];
            break;
        case 2:
            [_chart setHoleRadiusPrecent:value];
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    [self.view setNeedsLayout];
    
    UIImageView *BGImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [BGImageView setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    [BGImageView setImage:[UIImage imageNamed:@"bgscreen.jpg"]];
    [self.view addSubview:BGImageView];
    
    [self.view addSubview:[self StartSquareLoaderWithBlurEffect:YES Color:[UIColor whiteColor]]];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(GoTodifferentPage)
                                   userInfo:nil
                                    repeats:NO];
    
    /**
   
    CGRect MainFrame = [[UIScreen mainScreen] bounds];
    
    _CenterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MainFrame.size.width/2-65, 235, 130, 130)];
    [_CenterImageView setImage:[UIImage imageNamed:@"perseev_final_25012013.png"]];
    [_CenterImageView setBackgroundColor:[UIColor whiteColor]];
    _CenterImageView.layer.cornerRadius = 65.0f;
    _CenterImageView.clipsToBounds = YES;
    [self.view addSubview:_CenterImageView];
    
    if (!_chart) {
        _chart = [[VBPieChart alloc] init];
        [self.view addSubview:_chart];
    }
    
    
    [_chart setFrame:CGRectMake(MainFrame.size.width/2-150, 150, 300, 300)];
    [_chart setEnableStrokeColor:YES];
    [_chart setHoleRadiusPrecent:0.5];
    [_chart setDelegate:self];
    
    [_chart.layer setShadowOffset:CGSizeMake(2, 2)];
    [_chart.layer setShadowRadius:3];
    [_chart.layer setShadowColor:[UIColor blackColor].CGColor];
    [_chart.layer setShadowOpacity:0.7];
    
    self.chartValues = @[
                         @{@"name":@"first", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"1cricket.jpg"]]},
                         @{@"name":@"second", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"unnamed.png"]]},
                         @{@"name":@"third", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"Dennis-Lilllee.jpg"]]},
                         @{@"name":@"fourth 2", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"cricket-1.jpg"]]},
                         @{@"name":@"fourth 3", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"sehwag-mi300.jpg"]]},
                         @{@"name":@"fourth 4", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"Dennis-Lilllee.jpg"]]},
                         @{@"name":@"fourth 5", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"unnamed.png"]]},
                         @{@"name":@"fourth 6", @"value":@12.5, @"color":[UIColor colorWithPatternImage:[UIImage imageNamed:@"sehwag-mi300.jpg"]]}
                         ];
    
    [_chart setChartValues:_chartValues animation:YES];
     **/
}

-(void)GoTodifferentPage
{
    [super DealllocLoader];
    [super GotoLandingScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
