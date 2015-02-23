//
//  GlobalController.h
//  Perseev
//
//  Created by Mac on 23/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZSquaresLoading.h"
#import "UIColor+Perseev.h"

@interface GlobalController : UIViewController

-(UIView *)StartSquareLoaderWithBlurEffect:(BOOL)AddBlurEffect Color:(UIColor *)ParamColor;
-(void)DealllocLoader;

-(void)GotoDifferentViewWithAnimation:(UIViewController *)ViewControllerName;
-(UIView *)CreateViewHeaderWithBackButton:(BOOL)BoolBackOption;

-(void)GotoLandingScreen;
-(void)GotoLoginScreen;
-(void)GotoRegisterScreen;
@end
