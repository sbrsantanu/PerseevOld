//
//  SignUpScreen.m
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "SignUpScreen.h"

@implementation SignUpScreen

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    
    [self.view addSubview:[super CreateViewHeaderWithBackButton:YES]];
}

@end
