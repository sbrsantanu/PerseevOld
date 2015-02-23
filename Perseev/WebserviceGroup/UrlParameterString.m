//
//  UrlParameterString.m
//  Hema
//
//  Created by Mac on 05/12/14.
//  Copyright (c) 2014 Hema. All rights reserved.
//

#import "UrlParameterString.h"
#import "Strings.h"

@implementation UrlParameterString

/**
 *  Public Functions
 */

+(NSString *)GlobalURL { return kNWEBMainDomain; }

/**
 *  WebService URL List
 */

+(NSString *)URLParamHelppages { return kNWEBHelpParamURL; }

+(NSString *)URLParamFetchServiceCategory { return ServiceCategoryURL; }

+(NSString *)URLParamCustomerBookingSearch { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamCustomerBookingDetails { return kNWEBCustomerBookingDetailsParamURL; }

+(NSString *)URLParamCustomerBookingApply { return kNWEBCustomerBookingApplyParamURL; }

+(NSString *)URLParamCustomerRegistration  { return kNWEBCustomerRegistrationParamURL; }

+(NSString *)URLParamCustomerLogin  { return kNWEBCustomerLoginParamURL; }

+(NSString *)URLParamCustomerForgetPassword  { return kNWEBCustomerForgetPasswordParamURL; }

+(NSString *)URLParamCustomerDashboard  { return kNWEBCustomerDashboardParamURL; }

+(NSString *)URLParamCustomerViewProfile  { return kNWEBCustomerViewProfileParamURL; }

+(NSString *)URLParamCustomerEditProfile  { return kNWEBCustomerEditProfileParamURL; }

+(NSString *)URLParamCustomerChangePassword  { return kNWEBCustomerChangePasswordParamURL; }

+(NSString *)URLParamCustomerAddEvent  { return kNWEBCustomerAddEventParamURL; }

+(NSString *)URLParamCustomerEditEvent  { return kNWEBCustomerEditEventParamURL; }

+(NSString *)URLParamCustomerviewhistory  { return kNWEBCustomerviewhistoryParamURL; }

+(NSString *)URLParamCustomerviewevent  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamCustomerCompletedEvent  { return kNWEBCustomerCompletedEventParamURL; }

+(NSString *)URLParamCustomerViewCompletedEvent  { return kNWEBCustomerViewCompletedEventParamURL; }

+(NSString *)URLParamCustomerFeedback  { return kNWEBCustomerFeedbackParamURL; }

+(NSString *)URLParamCustomerContactWithAdmin  { return kNWEBCustomerContactWithAdminParamURL; }

+(NSString *)URLParamCustomerHistoryOfConversation  { return kNWEBCustomerCustomerHistoryOfConversationParamURL; }

+(NSString *)URLParamCustomerHistoryOfConversationDetailView  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamCustomerAddReply  { return kNWEBCustomerAddReplyParamURL; }

+(NSString *)URLParamCustomerNotification  { return kNWEBCustomerNotificationParamURL; }

+(NSString *)URLParamCustomerAllReplyList { return kNWEBCustomerMyIssuesIndividualListofRepliesforasingleissueParamURL; }

/* ************************ Provider *************************** */

+(NSString *)URLParamProviderConversionHistory  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderLogin  { return kNWEBProviderLoginParamURL; }

+(NSString *)URLParamProviderForgetPassword  { return kNWEBProviderForgetPasswordParamURL; }

+(NSString *)URLParamProviderDashboard  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderViewProfile  { return kNWEBProviderViewProfileParamURL; }

+(NSString *)URLParamProviderEditProfile  { return kNWEBProviderEditProfileParamURL; }

+(NSString *)URLParamProviderChangePassword  { return kNWEBProviderChangePasswordParamURL; }

+(NSString *)URLParamProviderAddService  { return kNWEBProviderAddServiceParamURL; }

+(NSString *)URLParamProviderViewServicelist  { return kNWEBProviderViewServicelistParamURL; }

+(NSString *)URLParamProviderViewServiceDetail  { return kNWEBProviderViewServiceDetailParamURL; }

+(NSString *)URLParamProviderEditService  { return kNWEBProviderEditServiceParamURL; }

+(NSString *)URLParamProviderQuotaionRequestsList  { return kNWEBProviderQuotaionRequestsListParamURL; }

+(NSString *)URLParamProviderQuotaionRequestsDetail  { return kNWEBProviderQuotationDetailParamURL; }

+(NSString *)URLParamProviderAddQuotation  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderEditQuotation  { return kNWEBProviderEditQuotationParamURL; }

+(NSString *)URLParamProviderMyQuotationList  { return kNWEBProviderMyQuotationListParamURL; }

+(NSString *)URLParamProviderMyQuotationRequestsListAddQuotation  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderQuotationDetail  { return kNWEBProviderQuotationDetailsParamURL; }

+(NSString *)URLParamProviderAddMessage  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderConversationList  { return kNWEBProviderConversationListParamURL; }

+(NSString *)URLParamProviderAddReply  { return kNWEBProviderAddReplyParamURLOne; }

+(NSString *)URLParamProviderContactWithHemaAdmin  { return kNWEBProviderContactWithHemaAdminParamURL; }

+(NSString *)URLParamProviderHistoryConversationList  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderReplyListforaSingleMessage  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderMyIssues  { return kNWEBProviderAllIssueListParamURL; }

+(NSString *)URLParamProviderMyIssuesDetails  { return kNWEBProviderAllIssueDetailsParamURL; }

+(NSString *)URLParamProviderMyIssuesIndividualAwarded  { return kNWEBCustomerBookingSearchParamURL; }

+(NSString *)URLParamProviderMyIssuesListofRepliesforasingleissue  { return kNWEBProviderMyIssuesIndividualListofRepliesforasingleissueParamURL; }

+(NSString *)URLParamProviderAllReplyList { return kNWEBProviderMyIssuesIndividualListofRepliesforasingleissueParamURL; }

+(NSString *)URLParamProviderAddReplyforanissue  { return kNWEBCustomerBookingSearchParamURL; }

/**
 *  Web Service Array Lists
 */

+(NSArray *)WebParamHelpPages { return [self ReturnWebArrayFromString:kNWEBParamHelpDetails]; }

+(NSArray *)WebParamCustomerBookingSearch { return [self ReturnWebArrayFromString:kNWEBParamCustomerBookingSearch]; }

+(NSArray *)WebParamCustomerBookingDetails { return [self ReturnWebArrayFromString:kNWEBParamCustomerBookingDetails]; }

+(NSArray *)WebParamCustomerBookingApply { return [self ReturnWebArrayFromString:kNWEBParamCustomerBookingApply]; }

/* ************************ Customer *************************** */

+(NSArray *)WebParamCustomerRegistration { return [self ReturnWebArrayFromString:kNWEBParamCustomerRegistration]; }

+(NSArray *)WebParamCustomerLogin { return [self ReturnWebArrayFromString:kNWEBParamCustomerLogin]; }

+(NSArray *)WebParamCustomerForgetPassword { return [self ReturnWebArrayFromString:kNWEBParamCustomerForgetPassword]; }

+(NSArray *)WebParamCustomerDashboard { return [self ReturnWebArrayFromString:kNWEBParamCustomerDashboard]; }

+(NSArray *)WebParamCustomerViewProfile { return [self ReturnWebArrayFromString:kNWEBParamCustomerViewProfile]; }

+(NSArray *)WebParamCustomerEditProfile { return [self ReturnWebArrayFromString:kNWEBParamCustomerEditProfile]; }

+(NSArray *)WebParamCustomerChangePassword { return [self ReturnWebArrayFromString:kNWEBParamCustomerChangePassword]; }

+(NSArray *)WebParamCustomerAddEvent { return [self ReturnWebArrayFromString:kNWEBParamCustomerAddEvent]; }

+(NSArray *)WebParamCustomerEditEvent { return [self ReturnWebArrayFromString:kNWEBParamCustomerEditEvent]; }

+(NSArray *)WebParamCustomerviewhistory { return [self ReturnWebArrayFromString:kNWEBParamCustomerviewhistory]; }

+(NSArray *)WebParamCustomerviewevent { return [self ReturnWebArrayFromString:kNWEBParamCustomerviewevent]; }

+(NSArray *)WebParamCustomerCompletedEvent { return [self ReturnWebArrayFromString:kNWEBParamCustomerCompletedEvent]; }

+(NSArray *)WebParamCustomerViewCompletedEvent { return [self ReturnWebArrayFromString:kNWEBParamCustomerViewCompletedEvent]; }

+(NSArray *)WebParamCustomerFeedback { return [self ReturnWebArrayFromString:kNWEBParamCustomerFeedback]; }

+(NSArray *)WebParamCustomerContactWithAdmin { return [self ReturnWebArrayFromString:kNWEBParamCustomerContactWithAdmin]; }

+(NSArray *)WebParamCustomerHistoryOfConversation { return [self ReturnWebArrayFromString:kNWEBParamCustomerHistoryOfConversation]; }

+(NSArray *)WebParamCustomerHistoryOfConversationDetailView { return [self ReturnWebArrayFromString:kNWEBParamCustomerHistoryOfConversationDetailView]; }

+(NSArray *)WebParamCustomerAddReply { return [self ReturnWebArrayFromString:kNWEBParamCustomerAddReply]; }

+(NSArray *)WebParamCustomerNotification { return [self ReturnWebArrayFromString:kNWEBParamCustomerNotification]; }

+(NSArray *)WebParamCustomerAllReplyList { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssuesListofRepliesforasingleissue]; }

/* ************************ Provider *************************** */

+(NSArray *)WebParamProviderConversionHistory { return [self ReturnWebArrayFromString:kNWEBParamProviderConversionHistory]; }

+(NSArray *)WebParamProviderLogin { return [self ReturnWebArrayFromString:kNWEBParamProviderLogin]; }

+(NSArray *)WebParamProviderForgetPassword { return [self ReturnWebArrayFromString:kNWEBParamProviderForgetPassword]; }

+(NSArray *)WebParamProviderDashboard { return [self ReturnWebArrayFromString:kNWEBParamProviderDashboard]; }

+(NSArray *)WebParamProviderViewProfile { return [self ReturnWebArrayFromString:kNWEBParamProviderViewProfile]; }

+(NSArray *)WebParamProviderEditProfile { return [self ReturnWebArrayFromString:kNWEBParamProviderEditProfile]; }

+(NSArray *)WebParamProviderChangePassword { return [self ReturnWebArrayFromString:kNWEBParamProviderChangePassword]; }

+(NSArray *)WebParamProviderAddService { return [self ReturnWebArrayFromString:kNWEBParamProviderAddService]; }

+(NSArray *)WebParamProviderViewServicelist { return [self ReturnWebArrayFromString:kNWEBParamProviderViewServicelist]; }

+(NSArray *)WebParamProviderViewServiceDetail { return [self ReturnWebArrayFromString:kNWEBParamProviderViewServiceDetail]; }

+(NSArray *)WebParamProviderEditService { return [self ReturnWebArrayFromString:kNWEBParamProviderEditService]; }

+(NSArray *)WebParamProviderQuotaionRequestsList { return [self ReturnWebArrayFromString:kNWEBParamProviderQuotaionRequestsList]; }

+(NSArray *)WebParamProviderQuotaionRequestsDetail { return [self ReturnWebArrayFromString:kNWEBParamProviderProviderQuotaionRequestsDetail]; }

+(NSArray *)WebParamProviderAddQuotation { return [self ReturnWebArrayFromString:kNWEBParamProviderProviderAddQuotation]; }

+(NSArray *)WebParamProviderEditQuotation { return [self ReturnWebArrayFromString:kNWEBParamProviderEditQuotation]; }

+(NSArray *)WebParamProviderMyQuotationList { return [self ReturnWebArrayFromString:kNWEBParamProviderMyQuotationList]; }

+(NSArray *)WebParamProviderMyQuotationRequestsListAddQuotation { return [self ReturnWebArrayFromString:kNWEBParamProviderMyQuotationRequestsListAddQuotation]; }

+(NSArray *)WebParamProviderQuotationDetail { return [self ReturnWebArrayFromString:kNWEBParamProviderQuotationDetail]; }

+(NSArray *)WebParamProviderAddMessage { return [self ReturnWebArrayFromString:kNWEBParamProviderAddMessage]; }

+(NSArray *)WebParamProviderConversationList { return [self ReturnWebArrayFromString:kNWEBParamProviderConversationList]; }

+(NSArray *)WebParamProviderAddReply { return [self ReturnWebArrayFromString:kNWEBParamProviderAddReply]; }

+(NSArray *)WebParamProviderContactWithHemaAdmin { return [self ReturnWebArrayFromString:kNWEBParamProviderContactWithHemaAdmin]; }

+(NSArray *)WebParamProviderHistoryConversationList { return [self ReturnWebArrayFromString:kNWEBParamProviderHistoryConversationList]; }

+(NSArray *)WebParamProviderReplyListforaSingleMessage { return [self ReturnWebArrayFromString:kNWEBParamProviderReplyListforaSingleMessage]; }

+(NSArray *)WebParamProviderMyIssues { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssues]; }

+(NSArray *)WebParamProviderMyIssuesIndividualAwarded { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssuesIndividualAwarded]; }

+(NSArray *)WebParamProviderMyIssuesListofRepliesforasingleissue { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssuesListofRepliesforasingleissue]; }

+(NSArray *)WebParamProviderAddReplyforanissue { return [self ReturnWebArrayFromString:kNWEBParamProviderAddReplyforanissue]; }

+(NSArray *)WebParamProviderAllReplyList { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssuesListofRepliesforasingleissue]; }

+(NSArray *)WebParamProviderMyIssuesDetails { return [self ReturnWebArrayFromString:kNWEBParamProviderMyIssuesDetails]; }

/**
 *  NonPublic Functions
 */

+(NSString *)GlobalSeperaterString { return kNWEBParamSeperater; }

+(NSArray *)ReturnWebArrayFromString:(NSString *)DataString { return [DataString componentsSeparatedByString:UrlParameterString.GlobalSeperaterString]; }

@end
