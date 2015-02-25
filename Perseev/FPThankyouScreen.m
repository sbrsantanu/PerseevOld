//
//  FPThankyouScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "FPThankyouScreen.h"
#import "GlobalAccessers.h"
#import "UITextField+Attribute.h"

@interface FPThankyouScreen()<UIScrollViewDelegate>

@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UIButton *LoginButton;
@end

@implementation FPThankyouScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    [self.view addSubview:[super CreateViewHeaderWithBackButton:NO]];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]-61)];
    [_MainScrollView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView setUserInteractionEnabled:YES];
    [self.view addSubview:_MainScrollView];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Thankyou" LabelHeight:@"35" LabelWidth:@"200" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"65" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-100)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"80" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." LabelHeight:@"200" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-40)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"320" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-40)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"350" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"15" LabelText:@"Back To" LabelHeight:@"35" LabelWidth:@"100" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"70" Yposition:@"350" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"15" LabelText:@"Login" LabelHeight:@"35" LabelWidth:@"150" LabelTextAlignment:NSTextAlignmentLeft]];
    
    _LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(20,345, [GlobalStrings GetScreenWidth]/2-40, 60)];
    [_LoginButton setTag:1112];
    [_LoginButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_MainScrollView addSubview:_LoginButton];
}
-(IBAction)ButtonClickEvent:(id)sender
{
    [super GotoLoginScreen];
}
@end
