//
//  SignUpScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "SignUpScreen.h"
#import "GlobalAccessers.h"
#import "UITextField+Attribute.h"

@interface SignUpScreen()<UITextFieldDelegate,UIScrollViewDelegate>

@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UITextField *UserId;
@property (nonatomic,retain) UITextField *UserPassword;
@property (nonatomic,retain) UITextField *UserFirstName;
@property (nonatomic,retain) UITextField *UserLastName;
@property (nonatomic,retain) UIButton *LoginButton;
@property (nonatomic,retain) UIButton *FpButton;
@property (nonatomic,retain) UIButton *AsButton;
@property (nonatomic,retain) UIButton *facebookButton;
@property (nonatomic,retain) UIButton *GoogleButton;
@end
@implementation SignUpScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    [self.view addSubview:[super CreateViewHeaderWithBackButton:YES]];
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]-61)];
    [_MainScrollView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView setUserInteractionEnabled:YES];
    [_MainScrollView setContentSize:CGSizeMake([GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]+[GlobalStrings GetScreenHeight]/4)];
    [self.view addSubview:_MainScrollView];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Register" LabelHeight:@"35" LabelWidth:@"100" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"90" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Now" LabelHeight:@"35" LabelWidth:@"150" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"65" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-100)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _UserFirstName = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserFirstName customizeWithplaceholderText:@"First Name" andImage:@" "];
    [_UserFirstName setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserFirstName setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserFirstName setTag:443];
    [_MainScrollView addSubview:_UserFirstName];
    
    _UserLastName = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserLastName customizeWithplaceholderText:@"last Name" andImage:@" "];
    [_UserLastName setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserLastName setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserLastName setTag:444];
    [_MainScrollView addSubview:_UserLastName];
    
    _UserId = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserId customizeWithplaceholderText:@"Username" andImage:@" "];
    [_UserId setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserId setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserId setTag:445];
    [_MainScrollView addSubview:_UserId];
    
    _UserPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserPassword customizeWithplaceholderText:@"Password" andImage:@" "];
    [_UserPassword setSecureTextEntry:YES];
    [_UserId setTag:446];
    [_UserPassword setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserPassword setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_MainScrollView addSubview:_UserPassword];
    
    for (id AlltextField in _MainScrollView.subviews) {
        if ([AlltextField isKindOfClass:[UITextField class]]) {
            UITextField *DatatextField = (UITextField *)AlltextField;
            [DatatextField setDelegate:self];
        }
    }
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"265" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"By clicking Join Now, you agree to Perseev's User Agreement, Privacy Policy and Cookie Policy" LabelHeight:@"100" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-40)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _LoginButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]/2-70 ,350, 140, 40)];
    [_LoginButton setBackgroundColor:[UIColor ColorPersevRedColor]];
    [_LoginButton setTitle:@"Join Now" forState:UIControlStateNormal];
    [_LoginButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_LoginButton setTag:1111];
    [_LoginButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_MainScrollView addSubview:_LoginButton];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"400" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"Already have an account?" LabelHeight:@"35" LabelWidth:[NSString stringWithFormat:@"%f",[GlobalStrings GetScreenWidth]/2] LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:[NSString stringWithFormat:@"%f",[GlobalStrings GetScreenWidth]/2-10] Yposition:@"400" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"SignIn" LabelHeight:@"35" LabelWidth:[NSString stringWithFormat:@"%f",[GlobalStrings GetScreenWidth]/2-20] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _AsButton = [[UIButton alloc] initWithFrame:CGRectMake(20,390, [GlobalStrings GetScreenWidth]-40, 60)];
    [_AsButton setTag:1113];
    [_AsButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_MainScrollView addSubview:_AsButton];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:[NSString stringWithFormat:@"%f",20.0f] Yposition:@"460" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-40)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"470" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"OR" LabelHeight:@"35" LabelWidth:[NSString stringWithFormat:@"%f",[GlobalStrings GetScreenWidth]-40] LabelTextAlignment:NSTextAlignmentCenter]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"490" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"12" LabelText:@"SIGNUP WITH" LabelHeight:@"35" LabelWidth:[NSString stringWithFormat:@"%f",[GlobalStrings GetScreenWidth]-40] LabelTextAlignment:NSTextAlignmentCenter]];
    
    _facebookButton = [[UIButton alloc] initWithFrame:CGRectMake(20,550, 130, 40)];
    [_facebookButton setBackgroundColor:[UIColor ColorPersevFbBlueColor]];
    [_facebookButton setTitle:@"FACEBOOK" forState:UIControlStateNormal];
    [_facebookButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_facebookButton setTag:1114];
    [_facebookButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_facebookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_MainScrollView addSubview:_facebookButton];
    
    _GoogleButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]-160 ,550, 130, 40)];
    [_GoogleButton setBackgroundColor:[UIColor ColorPersevRedColor]];
    [_GoogleButton setTitle:@"GOOGLE PLUS" forState:UIControlStateNormal];
    [_GoogleButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_GoogleButton setTag:1247];
    [_GoogleButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_GoogleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_MainScrollView addSubview:_GoogleButton];
}

-(IBAction)ButtonClickEvent:(UIButton *)sender
{
    switch (sender.tag) {
        case 1111:
            [self SignupProcess];
            break;
        case 1114:
            [self FacebookLoginProcess];
            break;
        case 1115:
            [self GoogleLoginProcess];
            break;
        case 1112:
            [super GotoForgetPasswordScreen];
            break;
        case 1113:
            [super GotoLoginScreen];
            break;
    }
}

-(void)SignupProcess
{
    [super GotoAddInfoScreen];
}

-(void)FacebookLoginProcess
{
    
}

-(void)GoogleLoginProcess
{
    
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
