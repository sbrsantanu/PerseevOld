//
//  main.m
//  Perseev
//
//  Created by Mac on 20/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        @try {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(@"Exception is --- %@",[NSString stringWithFormat:@"exception --%@",exception]);
            return 0;
        }
        return 0;
    }
}
