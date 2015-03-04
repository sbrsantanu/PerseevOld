//
//  SignupObject.m
//  Perseev
//
//  Created by Mac on 04/03/15.
//  Copyright (c) 2015 Perseev. All rights reserved.
//

#import "SignupObject.h"

@implementation SignupObject

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
         SignupProcessstep:(SignupProcessStep )ParamSignupProcessstep
{
    
    self = [super init];
    
    if(self) {
        
        UserDataObject *UserData    = [[UserDataObject alloc] initWithUserFirstName:ParamUserFirstName UserLastName:ParamUserLastName UserName:ParamUserName UserEmail:ParamUserEmail UserPassword:ParamUserPassword PerseevUserId:ParamPerseevUserId UserSex:ParamUserSex UserLocation:ParamUserLocation UserAge:ParamUserAge];
        self.UserDataObj            = UserData;
        self.UserSignUpOption       = ParamUserSignUpOption;
        self.SocialAccountId        = ParamSocialAccountId;
        self.SignupProcessstep      = ParamSignupProcessstep;
    }
    
    return self;
}

@end

@implementation UserDataObject

-(id)initWithUserFirstName:(NSString *)ParamUserFirstName
              UserLastName:(NSString *)ParamUserLastName
                  UserName:(NSString *)ParamUserName
                 UserEmail:(NSString *)ParamUserEmail
              UserPassword:(NSString *)ParamUserPassword
             PerseevUserId:(NSString *)ParamPerseevUserId
                   UserSex:(NSString *)ParamUserSex
              UserLocation:(NSString *)ParamUserLocation
                   UserAge:(NSString *)ParamUserAge
{
    self =[super init];
    if(self) {
        self.UserFirstName          = ParamUserFirstName;
        self.UserLastName           = ParamUserLastName;
        self.UserName               = ParamUserName;
        self.UserEmail              = ParamUserEmail;
        self.UserPassword           = ParamUserPassword;
        self.PerseevUserId          = ParamPerseevUserId;
        self.UserSex                = ParamUserSex;
        self.UserLocation           = ParamUserLocation;
        self.UserAge                = ParamUserAge;
    }
    return self;
}

@end
