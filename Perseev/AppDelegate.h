//
//  AppDelegate.h
//  Perseev
//
//  Created by Santanu Das Adhikary on 20/02/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <GooglePlus/GooglePlus.h>
#import <FacebookSDK/FacebookSDK.h>
#import "FbGraphFile.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GPPDeepLinkDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic,retain) UINavigationController *NavigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;

@property (strong, nonatomic) FBSession *session;

// Social Signup Process

-(void)SetLoginOptionFacebook;
-(void)SetLoginOptionGooglePlus;
-(void)UnsetLoginOption;
@end

