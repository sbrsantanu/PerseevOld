//
//  LandingScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "LandingScreen.h"
#import "GlobalAccessers.h"

@implementation LandingScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    UIImageView *BGImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight])];
    [BGImageView setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    [BGImageView setImage:[UIImage imageNamed:@"landingscreen.jpg"]];
    [self.view addSubview:BGImageView];
    
    [self.view setNeedsLayout];
    
    UIButton *LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, [GlobalStrings GetScreenHeight]-100, [GlobalStrings GetScreenWidth]/2-1, 100)];
    [LoginButton setBackgroundColor:[UIColor clearColor]];
    [LoginButton addTarget:self action:@selector(GotoLoginScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LoginButton];
    
    UIButton *RegisterButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]/2, [GlobalStrings GetScreenHeight]-100, [GlobalStrings GetScreenWidth]/2-1, 100)];
    [RegisterButton setBackgroundColor:[UIColor clearColor]];
    [RegisterButton addTarget:self action:@selector(GotoRegisterScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RegisterButton];
    
    //[self.view addSubview:[self StartSquareLoaderWithBlurEffect:YES Color:[UIColor blackColor]]];
}

-(void)GotoLoginScreen { [super GotoLoginScreen]; }

-(void)GotoRegisterScreen { [super GotoRegisterScreen]; }

@end
