//
//  GlobalController.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "GlobalController.h"
#import <QuartzCore/QuartzCore.h>
#import "LandingScreen.h"
#import "LoginScreen.h"
#import "SignUpScreen.h"
#import "ForgetPasswordScreen.h"
#import "GlobalAccessers.h"
#import "UIColor+Perseev.h"
#import "FPThankyouScreen.h"
#import "AddInformation.h"
#import "DashboardScreen.h"

@interface GlobalController () {
    RZSquaresLoading *_square;
}
@end

@implementation GlobalController

-(UIView *)StartSquareLoaderWithBlurEffect:(BOOL)AddBlurEffect Color:(UIColor *)ParamColor
{
    
    UIView *Viewlayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [Viewlayer setBackgroundColor:[UIColor clearColor]];
    
    UIView *ViewlayerOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [ViewlayerOne setBackgroundColor:ParamColor];
    [ViewlayerOne.layer setOpacity:0.7f];
    [Viewlayer addSubview:ViewlayerOne];
    
    UIView *ViewlayerTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [ViewlayerTwo setBackgroundColor:[UIColor clearColor]];
    [Viewlayer addSubview:ViewlayerTwo];
    
    _square = [[RZSquaresLoading alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 36) / 2,
                                                                 ([[UIScreen mainScreen] bounds].size.height - 36) / 2+160,
                                                                 36,
                                                                 36)];
    _square.color = [UIColor ColorPersevRedColor];
    [ViewlayerTwo addSubview:_square];
    
    return Viewlayer;
}

-(void)DealllocLoader
{
    _square = nil;
}

-(UIView *)CreateViewHeaderWithBackButton:(BOOL)BoolBackOption
{
    UIView *HeaderView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].origin.x, [[UIScreen mainScreen] bounds].origin.y, [[UIScreen mainScreen] bounds].size.width, 60)];
    [HeaderView.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [HeaderView.layer setShadowOffset:CGSizeMake([[UIScreen mainScreen] bounds].size.width, 10)];
    [HeaderView.layer setBackgroundColor:[UIColor ColorPersevBlackColor].CGColor];
    HeaderView.layer.masksToBounds = NO;
    HeaderView.layer.cornerRadius = 0; // if you like rounded corners
    HeaderView.layer.shadowOffset = CGSizeMake(0, 10);
    HeaderView.layer.shadowRadius = 5;
    HeaderView.layer.shadowOpacity = 0.5;
    
    UIImageView *LogoImage = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2-50, 20, 100, 25)];
    [LogoImage setBackgroundColor:[UIColor clearColor]];
    [LogoImage setImage:[UIImage imageNamed:@"perseev_final_25012013"]];
    [HeaderView addSubview:LogoImage];
    
    if (BoolBackOption) {
        
        UIImageView *BackImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 24, 24)];
        [BackImage setBackgroundColor:[UIColor clearColor]];
        [BackImage setImage:[UIImage imageNamed:@"backimg"]];
        [HeaderView addSubview:BackImage];
        
        UIButton *BackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
        [BackButton setBackgroundColor:[UIColor clearColor]];
        [BackButton addTarget:self action:@selector(goBackToPrev) forControlEvents:UIControlEventTouchUpInside];
        [HeaderView addSubview:BackButton];
        
    }
    
    return HeaderView;
}

-(void)goBackToPrev
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.25f;
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)GotoDifferentViewWithAnimation:(UIViewController *)ViewControllerName {
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.25f;
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:ViewControllerName animated:NO];
    
}

-(void)GotoLandingScreen
{
    LandingScreen *DatalandingScreen = [[LandingScreen alloc] init];
    [self GotoDifferentViewWithAnimation:DatalandingScreen];
}

-(void)GotoLoginScreen
{
    LoginScreen *DataLoginScreen = [[LoginScreen alloc] init];
    [self GotoDifferentViewWithAnimation:DataLoginScreen];
}

-(void)GotoRegisterScreen
{
    SignUpScreen *DataSignUpScreen = [[SignUpScreen alloc] init];
    [self GotoDifferentViewWithAnimation:DataSignUpScreen];
}
-(void)GotoForgetPasswordScreen
{
    ForgetPasswordScreen *Forgetpassword = [[ForgetPasswordScreen alloc] init];
    [self GotoDifferentViewWithAnimation:Forgetpassword];
}

-(void)GotoForgetPasswordThanksScreen
{
    FPThankyouScreen *FPThanks = [[FPThankyouScreen alloc] init];
    [self GotoDifferentViewWithAnimation:FPThanks];
}

-(void)GotoAddInfoScreen
{
    AddInformation *AddInformationView = [[AddInformation alloc] init];
    [self GotoDifferentViewWithAnimation:AddInformationView];
}

-(void)GotoDashboardScreen
{
    DashboardScreen *dashboard = [[DashboardScreen alloc] init];
    [self GotoDifferentViewWithAnimation:dashboard];
}
@end
