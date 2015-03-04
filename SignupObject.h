//
//  SignupObject.h
//  Perseev
//
//  Created by Mac on 04/03/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

typedef enum {
    UserSignUpTypeNormal,
    UserSignUpTypeFaceBook,
    UserSignUpTypeGooglePlus
} UserSignUpType;

typedef enum {
    SignupProcessStepNone,
    SignupProcessStepOne,
    SignupProcessStepTwo
} SignupProcessStep;

#import <Foundation/Foundation.h>

@class UserDataObject;

@interface SignupObject : NSObject

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) UserDataObject *UserDataObj;

/**
 *   User First name, type string
 **/

@property (assign) UserSignUpType UserSignUpOption;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *SocialAccountId;

/**
 *   User First name, type string
 **/

@property (assign) SignupProcessStep SignupProcessstep;


-(id)initWithUserFirstName:(NSString *)ParamUserFirstName
              UserLastName:(NSString *)ParamUserLastName
                  UserName:(NSString *)ParamUserName
                 UserEmail:(NSString *)ParamUserEmail
              UserPassword:(NSString *)ParamUserPassword
          UserSignUpOption:(UserSignUpType )ParamUserSignUpOption
             PerseevUserId:(NSString *)ParamPerseevUserId
                   UserSex:(NSString *)ParamUserSex
              UserLocation:(NSString *)ParamUserLocation
                   UserAge:(NSString *)ParamUserAge
           SocialAccountId:(NSString *)ParamSocialAccountId
         SignupProcessstep:(SignupProcessStep )ParamSignupProcessstep;

@end


@interface UserDataObject : NSObject

/**
 *   User First name, type string
 **/

@property (nonatomic,retain ) NSString *UserFirstName;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserLastName;

/**
 *   User First name, type string
 **/

@property(nonatomic,retain) NSString *UserName;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserEmail;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserPassword;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *PerseevUserId;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserSex;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserLocation;

/**
 *   User First name, type string
 **/

@property (nonatomic,retain) NSString *UserAge;

-(id)initWithUserFirstName:(NSString *)ParamUserFirstName
              UserLastName:(NSString *)ParamUserLastName
                  UserName:(NSString *)ParamUserName
                 UserEmail:(NSString *)ParamUserEmail
              UserPassword:(NSString *)ParamUserPassword
             PerseevUserId:(NSString *)ParamPerseevUserId
                   UserSex:(NSString *)ParamUserSex
              UserLocation:(NSString *)ParamUserLocation
                   UserAge:(NSString *)ParamUserAge;

@end
