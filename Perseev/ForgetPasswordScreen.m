//
//  ForgetPasswordScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "ForgetPasswordScreen.h"
#import "GlobalAccessers.h"
#import "UITextField+Attribute.h"

@interface ForgetPasswordScreen()<UITextFieldDelegate,UIScrollViewDelegate>

@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UIButton *FpButton;
@property (nonatomic,retain) UIButton *LoginButton;
@property (nonatomic,retain) UITextField *UserId;
@end

@implementation ForgetPasswordScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    [self.view addSubview:[super CreateViewHeaderWithBackButton:YES]];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]-61)];
    [_MainScrollView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView setUserInteractionEnabled:YES];
    [self.view addSubview:_MainScrollView];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Password" LabelHeight:@"35" LabelWidth:@"100" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"100" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Recovery" LabelHeight:@"35" LabelWidth:@"150" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"65" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-100)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _UserId = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserId customizeWithplaceholderText:@"Email" andImage:@" "];
    [_UserId setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserId setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserId setTag:443];
    [_MainScrollView addSubview:_UserId];
    
    for (id AlltextField in _MainScrollView.subviews) {
        if ([AlltextField isKindOfClass:[UITextField class]]) {
            UITextField *DatatextField = (UITextField *)AlltextField;
            [DatatextField setDelegate:self];
        }
    }
    
    _LoginButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]/2-70 ,160, 140, 40)];
    [_LoginButton setBackgroundColor:[UIColor ColorPersevRedColor]];
    [_LoginButton setTitle:@"Recover" forState:UIControlStateNormal];
    [_LoginButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_LoginButton setTag:1111];
    [_LoginButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_MainScrollView addSubview:_LoginButton];
}
-(IBAction)ButtonClickEvent:(UIButton *)sender
{
    [super GotoForgetPasswordThanksScreen];
}
@end
