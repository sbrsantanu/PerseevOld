//
//  AddInformation.h
//  Perseev
//
//  Created by Mac on 24/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalController.h"

@class SearchViewController;

@interface AddInformation : GlobalController {
    SearchViewController * semiVC;
}
@property (nonatomic,retain) NSString *DataVal;
@end
