//
//  SearchViewController.h
//  GooglePlacesAutocomplete
//
//  Created by Adam Cooper on 11/3/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedLocation.h"
#import "GlobalController.h"

@class SearchViewController;

@protocol SearchViewControllerDelegate <NSObject>

@required

-(void)RetunLocationFieldDataWithSuccess:(SearchViewController *)DataDelegate ObjectCarrier:(NSString *)ParamObjectCarrier;
//-(void)RetunLocationFieldDataWithError:(SearchViewController *)DataDelegate ObjectCarrier:(NSError *)ParamObjectCarrier;

@end

@interface SearchViewController : GlobalController
{
     __weak id <SearchViewControllerDelegate> _delegate;
}
@property (nonatomic, weak) id <SearchViewControllerDelegate> delegate;
@property SelectedLocation *selectedLocation;

@end
