//
//  LoginScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "LoginScreen.h"
#import "GlobalAccessers.h"
#import "UITextField+Attribute.h"

@interface LoginScreen ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UITextField *UserId;
@property (nonatomic,retain) UITextField *UserPassword;
@property (nonatomic,retain) UIButton *LoginButton;

@end

@implementation LoginScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    [self.view addSubview:[super CreateViewHeaderWithBackButton:YES]];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]-61)];
    [_MainScrollView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView setUserInteractionEnabled:YES];
    [self.view addSubview:_MainScrollView];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"15" LabelText:@"Login" LabelHeight:@"35" LabelWidth:@"40" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"55" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"15" LabelText:@"Your Account" LabelHeight:@"35" LabelWidth:@"150" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"60" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-100)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _UserId = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserId customizeWithplaceholderText:@"Username" andImage:@" "];
    [_UserId setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserId setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserId setTag:443];
    [_MainScrollView addSubview:_UserId];
    
    _UserPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserPassword customizeWithplaceholderText:@"Password" andImage:@" "];
    [_UserPassword setSecureTextEntry:YES];
    [_UserPassword setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserPassword setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_MainScrollView addSubview:_UserPassword];
    
    for (id AlltextField in _MainScrollView.subviews) {
        if ([AlltextField isKindOfClass:[UITextField class]]) {
            UITextField *DatatextField = (UITextField *)AlltextField;
            [DatatextField setDelegate:self];
        }
    }
    
    _LoginButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]/2-70 ,200, 140, 40)];
    [_LoginButton setBackgroundColor:[UIColor ColorPersevRedColor]];
    [_LoginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_LoginButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_LoginButton.layer setCornerRadius:3.0f];
    [_LoginButton addTarget:self action:@selector(LoginProcess) forControlEvents:UIControlEventTouchUpInside];
    [_LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_LoginButton setTag:104];
    [_MainScrollView addSubview:_LoginButton];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _UserId) {
        [UIView animateWithDuration:1.0 animations:^(void){
            [_MainScrollView setContentOffset:CGPointMake(0, 50)];
        } completion:nil];
    } else if (textField == _UserPassword) {
        [UIView animateWithDuration:1.0 animations:^(void){
            [_MainScrollView setContentOffset:CGPointMake(0, 85)];
        } completion:nil];
    }
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView animateWithDuration:1.0 animations:^(void){
        [_MainScrollView setContentOffset:CGPointMake(0, -20)];
    } completion:nil];
    return YES;
}

-(void)viewDidDisappear:(BOOL)animated
{
    for (id AlltextField in _MainScrollView.subviews) {
        if ([AlltextField isKindOfClass:[UITextField class]]) {
            UITextField *DatatextField = (UITextField *)AlltextField;
            [DatatextField resignFirstResponder];
            [DatatextField setText:nil];
        }
    }
}


@end
