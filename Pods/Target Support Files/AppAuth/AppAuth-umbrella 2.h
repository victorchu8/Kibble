#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AppAuth 2.h"
#import "AppAuth 3.h"
#import "AppAuthCore 2.h"
#import "AppAuthCore 3.h"
#import "AppAuthCore.h"
#import "OIDAuthorizationRequest 2.h"
#import "OIDAuthorizationRequest 3.h"
#import "OIDAuthorizationRequest.h"
#import "OIDAuthorizationResponse 2.h"
#import "OIDAuthorizationResponse 3.h"
#import "OIDAuthorizationResponse.h"
#import "OIDAuthorizationService 3.h"
#import "OIDAuthorizationService 4.h"
#import "OIDAuthorizationService.h"
#import "OIDAuthState 2.h"
#import "OIDAuthState 3.h"
#import "OIDAuthState.h"
#import "OIDAuthStateChangeDelegate 2.h"
#import "OIDAuthStateChangeDelegate 3.h"
#import "OIDAuthStateChangeDelegate.h"
#import "OIDAuthStateErrorDelegate 2.h"
#import "OIDAuthStateErrorDelegate 3.h"
#import "OIDAuthStateErrorDelegate.h"
#import "OIDClientMetadataParameters 2.h"
#import "OIDClientMetadataParameters 3.h"
#import "OIDClientMetadataParameters.h"
#import "OIDDefines 2.h"
#import "OIDDefines 3.h"
#import "OIDDefines.h"
#import "OIDEndSessionRequest 2.h"
#import "OIDEndSessionRequest 3.h"
#import "OIDEndSessionRequest.h"
#import "OIDEndSessionResponse 2.h"
#import "OIDEndSessionResponse 3.h"
#import "OIDEndSessionResponse.h"
#import "OIDError 2.h"
#import "OIDError 3.h"
#import "OIDError.h"
#import "OIDErrorUtilities 2.h"
#import "OIDErrorUtilities 3.h"
#import "OIDErrorUtilities.h"
#import "OIDExternalUserAgent 2.h"
#import "OIDExternalUserAgent 3.h"
#import "OIDExternalUserAgent.h"
#import "OIDExternalUserAgentRequest 2.h"
#import "OIDExternalUserAgentRequest 3.h"
#import "OIDExternalUserAgentRequest.h"
#import "OIDExternalUserAgentSession 2.h"
#import "OIDExternalUserAgentSession 3.h"
#import "OIDExternalUserAgentSession.h"
#import "OIDFieldMapping 2.h"
#import "OIDFieldMapping 3.h"
#import "OIDFieldMapping.h"
#import "OIDGrantTypes 2.h"
#import "OIDGrantTypes 3.h"
#import "OIDGrantTypes.h"
#import "OIDIDToken 2.h"
#import "OIDIDToken 3.h"
#import "OIDIDToken.h"
#import "OIDRegistrationRequest 2.h"
#import "OIDRegistrationRequest 3.h"
#import "OIDRegistrationRequest.h"
#import "OIDRegistrationResponse 2.h"
#import "OIDRegistrationResponse 3.h"
#import "OIDRegistrationResponse.h"
#import "OIDResponseTypes 2.h"
#import "OIDResponseTypes 3.h"
#import "OIDResponseTypes.h"
#import "OIDScopes 2.h"
#import "OIDScopes 3.h"
#import "OIDScopes.h"
#import "OIDScopeUtilities 2.h"
#import "OIDScopeUtilities 3.h"
#import "OIDScopeUtilities.h"
#import "OIDServiceConfiguration 2.h"
#import "OIDServiceConfiguration 3.h"
#import "OIDServiceConfiguration.h"
#import "OIDServiceDiscovery 2.h"
#import "OIDServiceDiscovery 3.h"
#import "OIDServiceDiscovery.h"
#import "OIDTokenRequest 2.h"
#import "OIDTokenRequest 3.h"
#import "OIDTokenRequest.h"
#import "OIDTokenResponse 2.h"
#import "OIDTokenResponse 3.h"
#import "OIDTokenResponse.h"
#import "OIDTokenUtilities 2.h"
#import "OIDTokenUtilities 3.h"
#import "OIDTokenUtilities.h"
#import "OIDURLQueryComponent 2.h"
#import "OIDURLQueryComponent 3.h"
#import "OIDURLQueryComponent.h"
#import "OIDURLSessionProvider 2.h"
#import "OIDURLSessionProvider 3.h"
#import "OIDURLSessionProvider.h"
#import "AppAuth 2.h"
#import "AppAuth 3.h"
#import "AppAuth.h"
#import "AppAuthCore 2.h"
#import "AppAuthCore 3.h"
#import "AppAuthCore.h"
#import "OIDAuthorizationRequest 2.h"
#import "OIDAuthorizationRequest 3.h"
#import "OIDAuthorizationRequest.h"
#import "OIDAuthorizationResponse 2.h"
#import "OIDAuthorizationResponse 3.h"
#import "OIDAuthorizationResponse.h"
#import "OIDAuthorizationService 3.h"
#import "OIDAuthorizationService 4.h"
#import "OIDAuthorizationService.h"
#import "OIDAuthState 2.h"
#import "OIDAuthState 3.h"
#import "OIDAuthState.h"
#import "OIDAuthStateChangeDelegate 2.h"
#import "OIDAuthStateChangeDelegate 3.h"
#import "OIDAuthStateChangeDelegate.h"
#import "OIDAuthStateErrorDelegate 2.h"
#import "OIDAuthStateErrorDelegate 3.h"
#import "OIDAuthStateErrorDelegate.h"
#import "OIDClientMetadataParameters 2.h"
#import "OIDClientMetadataParameters 3.h"
#import "OIDClientMetadataParameters.h"
#import "OIDDefines 2.h"
#import "OIDDefines 3.h"
#import "OIDDefines.h"
#import "OIDEndSessionRequest 2.h"
#import "OIDEndSessionRequest 3.h"
#import "OIDEndSessionRequest.h"
#import "OIDEndSessionResponse 2.h"
#import "OIDEndSessionResponse 3.h"
#import "OIDEndSessionResponse.h"
#import "OIDError 2.h"
#import "OIDError 3.h"
#import "OIDError.h"
#import "OIDErrorUtilities 2.h"
#import "OIDErrorUtilities 3.h"
#import "OIDErrorUtilities.h"
#import "OIDExternalUserAgent 2.h"
#import "OIDExternalUserAgent 3.h"
#import "OIDExternalUserAgent.h"
#import "OIDExternalUserAgentRequest 2.h"
#import "OIDExternalUserAgentRequest 3.h"
#import "OIDExternalUserAgentRequest.h"
#import "OIDExternalUserAgentSession 2.h"
#import "OIDExternalUserAgentSession 3.h"
#import "OIDExternalUserAgentSession.h"
#import "OIDFieldMapping 2.h"
#import "OIDFieldMapping 3.h"
#import "OIDFieldMapping.h"
#import "OIDGrantTypes 2.h"
#import "OIDGrantTypes 3.h"
#import "OIDGrantTypes.h"
#import "OIDIDToken 2.h"
#import "OIDIDToken 3.h"
#import "OIDIDToken.h"
#import "OIDRegistrationRequest 2.h"
#import "OIDRegistrationRequest 3.h"
#import "OIDRegistrationRequest.h"
#import "OIDRegistrationResponse 2.h"
#import "OIDRegistrationResponse 3.h"
#import "OIDRegistrationResponse.h"
#import "OIDResponseTypes 2.h"
#import "OIDResponseTypes 3.h"
#import "OIDResponseTypes.h"
#import "OIDScopes 2.h"
#import "OIDScopes 3.h"
#import "OIDScopes.h"
#import "OIDScopeUtilities 2.h"
#import "OIDScopeUtilities 3.h"
#import "OIDScopeUtilities.h"
#import "OIDServiceConfiguration 2.h"
#import "OIDServiceConfiguration 3.h"
#import "OIDServiceConfiguration.h"
#import "OIDServiceDiscovery 2.h"
#import "OIDServiceDiscovery 3.h"
#import "OIDServiceDiscovery.h"
#import "OIDTokenRequest 2.h"
#import "OIDTokenRequest 3.h"
#import "OIDTokenRequest.h"
#import "OIDTokenResponse 2.h"
#import "OIDTokenResponse 3.h"
#import "OIDTokenResponse.h"
#import "OIDTokenUtilities 2.h"
#import "OIDTokenUtilities 3.h"
#import "OIDTokenUtilities.h"
#import "OIDURLQueryComponent 2.h"
#import "OIDURLQueryComponent 3.h"
#import "OIDURLQueryComponent.h"
#import "OIDURLSessionProvider 2.h"
#import "OIDURLSessionProvider 3.h"
#import "OIDURLSessionProvider.h"
#import "OIDAuthorizationService+IOS 2.h"
#import "OIDAuthorizationService+IOS 3.h"
#import "OIDAuthorizationService+IOS.h"
#import "OIDAuthState+IOS 2.h"
#import "OIDAuthState+IOS 3.h"
#import "OIDAuthState+IOS.h"
#import "OIDExternalUserAgentCatalyst 2.h"
#import "OIDExternalUserAgentCatalyst 3.h"
#import "OIDExternalUserAgentCatalyst.h"
#import "OIDExternalUserAgentIOS 3.h"
#import "OIDExternalUserAgentIOS 4.h"
#import "OIDExternalUserAgentIOS.h"
#import "OIDExternalUserAgentIOSCustomBrowser 2.h"
#import "OIDExternalUserAgentIOSCustomBrowser 3.h"
#import "OIDExternalUserAgentIOSCustomBrowser.h"

FOUNDATION_EXPORT double AppAuthVersionNumber;
FOUNDATION_EXPORT const unsigned char AppAuthVersionString[];
