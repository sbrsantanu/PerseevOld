//
//  AddInformation.m
//  Perseev
//
//  Created by Mac on 24/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "AddInformation.h"
#import "GlobalAccessers.h"
#import "UITextField+Attribute.h"
#import "RMPickerViewController.h"
#import "SearchViewController.h"
#import "UIViewController+KNSemiModal.h"
#import "TRAutocompleteView.h"
#import "TRGoogleMapsAutocompleteItemsSource.h"
#import "TRTextFieldExtensions.h"
#import "TRGoogleMapsAutocompletionCellFactory.h"

typedef enum
{
    SelectionTypeNone,
    SelectionTypeSex,
    SelectionTypeAge
} SelectionType;

@interface AddInformation ()<UIScrollViewDelegate,UITextFieldDelegate,RMPickerViewControllerDelegate,SearchViewControllerDelegate>
{
    __weak IBOutlet UITextField *_textField;
    TRAutocompleteView *_autocompleteView;
    NSTimer *t;
}
@property (nonatomic,retain) UIScrollView *MainScrollView;
@property (nonatomic,retain) UITextField *UserSex;
@property (nonatomic,retain) UITextField *UserAge;
@property (nonatomic,retain) UITextField *UserLocation;
@property (nonatomic,retain) UIButton *SubmitButton;
@property (nonatomic,retain) NSMutableArray *SexArray;
@property (nonatomic,retain) NSMutableArray *AgeArray;
@property (assign) SelectionType DropdownSelectionMode;
@property (nonatomic,retain) UIView *LoaderView;
@end

@implementation AddInformation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Take note that you need to take ownership of the ViewController that is being presented
        semiVC = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
        
        // You can optionally listen to notifications
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(semiModalPresented:)
                                                     name:kSemiModalDidShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(semiModalDismissed:)
                                                     name:kSemiModalDidHideNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(semiModalResized:)
                                                     name:kSemiModalWasResizedNotification
                                                   object:nil];
        
    }
    return self;
}

#pragma mark - Optional notifications

- (void) semiModalResized:(NSNotification *) notification {
    if(notification.object == self){
        NSLog(@"The view controller presented was been resized");
    }
}

- (void)semiModalPresented:(NSNotification *) notification {
    if (notification.object == self) {
        NSLog(@"This view controller just shown a view with semi modal annimation");
    }
}
- (void)semiModalDismissed:(NSNotification *) notification {
    if (notification.object == self) {
        NSLog(@"A view controller was dismissed with semi modal annimation");
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor ColorPersevWhiteColor]];
    [self.view addSubview:[super CreateViewHeaderWithBackButton:NO]];
    
    NSLog(@"DataVal ----- %@",_DataVal);
    
    [self.navigationController setNavigationBarHidden:YES];
    
    _DropdownSelectionMode = SelectionTypeNone;
    
    _MainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 61, [GlobalStrings GetScreenWidth], [GlobalStrings GetScreenHeight]-61)];
    [_MainScrollView setBackgroundColor:[UIColor clearColor]];
    [_MainScrollView setUserInteractionEnabled:YES];
    [self.view addSubview:_MainScrollView];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevRedColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Add" LabelHeight:@"35" LabelWidth:@"40" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"53" Yposition:@"25" BackgroundColor:[UIColor clearColor] LabelTextColor:[UIColor ColorPersevBlackColor] LabelFontName:[GlobalStrings FontOswald] LabelFontSize:@"20" LabelText:@"Information" LabelHeight:@"35" LabelWidth:@"150" LabelTextAlignment:NSTextAlignmentLeft]];
    
    [_MainScrollView addSubview:[GlobalAccessers getUILabelWithXposition:@"20" Yposition:@"65" BackgroundColor:[UIColor lightGrayColor] LabelTextColor:nil LabelFontName:nil LabelFontSize:nil LabelText:nil LabelHeight:@"1" LabelWidth:[NSString stringWithFormat:@"%f",([GlobalStrings GetScreenWidth]-100)] LabelTextAlignment:NSTextAlignmentLeft]];
    
    _UserSex = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserSex customizeWithplaceholderText:@"Sex" andImage:@" "];
    [_UserSex setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserSex setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_UserSex setTag:443];
    [_MainScrollView addSubview:_UserSex];
    
    _UserAge = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserAge customizeWithplaceholderText:@"Age" andImage:@" "];
    [_UserAge setSecureTextEntry:NO];
    [_UserAge setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserAge setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_MainScrollView addSubview:_UserAge];
    
    _UserLocation = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, [GlobalStrings GetScreenWidth]-40, 40)];
    [_UserLocation customizeWithplaceholderText:@"Location" andImage:@" "];
    [_UserLocation setSecureTextEntry:NO];
    [_UserLocation setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_UserLocation setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_MainScrollView addSubview:_UserLocation];
    
    for (id AlltextField in _MainScrollView.subviews) {
        if ([AlltextField isKindOfClass:[UITextField class]]) {
            UITextField *DatatextField = (UITextField *)AlltextField;
            [DatatextField setDelegate:self];
        }
    }
    
    _SubmitButton = [[UIButton alloc] initWithFrame:CGRectMake([GlobalStrings GetScreenWidth]/2-70 ,250, 140, 40)];
    [_SubmitButton setBackgroundColor:[UIColor ColorPersevRedColor]];
    [_SubmitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [_SubmitButton.titleLabel setFont:[UIFont fontWithName:[GlobalStrings FontOswald] size:12.0f]];
    [_SubmitButton setTag:1111];
    [_SubmitButton addTarget:self action:@selector(ButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_MainScrollView addSubview:_SubmitButton];
    
    _SexArray = [[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    _AgeArray = [[NSMutableArray alloc] init];
    for (int ss = 17; ss<150; ss++) {
        [_AgeArray addObject:[NSString stringWithFormat:@"%d",ss]];
    }
    
    SearchViewController *SearchView = [[SearchViewController alloc] init];
    [SearchView setDelegate:self];
}

-(void)RetunLocationFieldDataWithSuccess:(SearchViewController *)DataDelegate ObjectCarrier:(NSString *)ParamObjectCarrier
{
    NSLog(@"ParamObjectCarrier --- %@",ParamObjectCarrier);
}

-(IBAction)ButtonClickEvent:(UIButton *)sender
{
    _LoaderView = [self StartSquareLoaderWithBlurEffect:YES Color:[UIColor whiteColor]];
    [self.view addSubview:_LoaderView];
    t = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                                  target: self
                                                selector:@selector(onTick)
                                                userInfo: nil repeats:NO];
}
-(void)onTick
{
    [t invalidate];
    [super GotoDashboardScreen];
}
-(void)LoginProcess
{
    NSLog(@"Login Process start");
}

-(void)FacebookLoginProcess
{
    
}

-(void)GoogleLoginProcess
{
    
}

#pragma mark - RMPickerViewController Delegates

- (void)pickerViewController:(RMPickerViewController *)vc didSelectRows:(NSArray *)selectedRows
{
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField resignFirstResponder];
        }
    }
    if (_DropdownSelectionMode == SelectionTypeSex) {
        [_UserSex setText:[NSString stringWithFormat:@"%@",[_SexArray objectAtIndex:[[selectedRows objectAtIndex:0] intValue]]]];
    } else if (_DropdownSelectionMode == SelectionTypeAge) {
        [_UserAge setText:[NSString stringWithFormat:@"%@", [_AgeArray objectAtIndex:[[selectedRows objectAtIndex:0] intValue]]]];
    }
    _DropdownSelectionMode = SelectionTypeNone;
}

- (void)pickerViewControllerDidCancel:(RMPickerViewController *)vc
{
    _DropdownSelectionMode = SelectionTypeNone;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (_DropdownSelectionMode == SelectionTypeSex) {
        return [_SexArray count];
    } else {
        return [_AgeArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (_DropdownSelectionMode == SelectionTypeSex) {
        return [_SexArray objectAtIndex:row];
    } else {
        return [_AgeArray objectAtIndex:row];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _UserSex) {
        for(id aSubView in [_MainScrollView subviews])
        {
            if([aSubView isKindOfClass:[UITextField class]])
            {
                UITextField *textField=(UITextField*)aSubView;
                [textField resignFirstResponder];
            }
        }
        [UIView animateWithDuration:1.0 animations:^(void){
           // [_MainScrollView setContentOffset:CGPointMake(0, 50)];
        } completion:nil];
        [self openPickerController:textField];
    } else if (textField == _UserAge) {
        for(id aSubView in [_MainScrollView subviews])
        {
            if([aSubView isKindOfClass:[UITextField class]])
            {
                UITextField *textField=(UITextField*)aSubView;
                [textField resignFirstResponder];
            }
        }
        [UIView animateWithDuration:1.0 animations:^(void){
            //[_MainScrollView setContentOffset:CGPointMake(0, 85)];
        } completion:nil];
        [self openPickerController:textField];
    } else if (textField == _UserLocation) {
        [textField becomeFirstResponder];
        [UIView animateWithDuration:1.0 animations:^(void){
            [_MainScrollView setContentOffset:CGPointMake(0, 120)];
        } completion:nil];
        [_UserLocation setLeftPadding:9];
        _autocompleteView = [TRAutocompleteView autocompleteViewBindedTo:_UserLocation
                                                             usingSource:[[TRGoogleMapsAutocompleteItemsSource alloc]
                                                                          initWithMinimumCharactersToTrigger:2
                                                                          apiKey:@"AIzaSyDtRdNIuvkvb3VOPRgiuaCaMYFFBPivXnY"]
                                                             cellFactory:[[TRGoogleMapsAutocompletionCellFactory alloc]
                                                                          initWithCellForegroundColor:[UIColor lightGrayColor]
                                                                          fontSize:14]
                                                            presentingIn:self];
        _autocompleteView.topMargin = -5;
        _autocompleteView.backgroundColor = [UIColor colorWithRed:(27) / 255.0f
                                                            green:(27) / 255.0f
                                                             blue:(27) / 255.0f
                                                            alpha:1];
        
        _autocompleteView.didAutocompleteWith = ^(id<TRSuggestionItem> item)
        {
            NSLog(@"Autocompleted with: %@", item.completionText);
            [UIView animateWithDuration:1.0 animations:^(void){
                [_MainScrollView setContentOffset:CGPointMake(0, -20)];
            } completion:nil];
        };

        
//        [UIView animateWithDuration:1.0 animations:^(void){
//           // [_MainScrollView setContentOffset:CGPointMake(0, 160)];
//        } completion:nil];
//        [self.navigationController presentSemiViewController:semiVC withOptions:@{
//                                                                                  KNSemiModalOptionKeys.pushParentBack    : @(YES),
//                                                                                  KNSemiModalOptionKeys.animationDuration : @(2.0),
//                                                                                  KNSemiModalOptionKeys.shadowOpacity     : @(0.3),
//                                                                                  }];
    }
}

- (IBAction)openPickerController:(UITextField *)sender {
    
    for(id aSubView in [_MainScrollView subviews])
    {
        if([aSubView isKindOfClass:[UITextField class]])
        {
            UITextField *textField=(UITextField*)aSubView;
            [textField resignFirstResponder];
        }
    }
    
    RMPickerViewController *pickerVC = [RMPickerViewController pickerController];
    pickerVC.delegate = self;
    pickerVC.titleLabel.text = @"Please choose a row and press 'Select' or 'Cancel'.";
    if (sender == _UserSex) {
        _DropdownSelectionMode = SelectionTypeSex;
    } else if (sender == _UserAge) {
        _DropdownSelectionMode = SelectionTypeAge;
    }
    [pickerVC show];
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
     _DropdownSelectionMode = SelectionTypeNone;
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
     _DropdownSelectionMode = SelectionTypeNone;
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // [textField resignFirstResponder];
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
