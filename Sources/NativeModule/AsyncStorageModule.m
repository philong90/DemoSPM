//
//  AsyncStorageModule.m
//  NativeModuleDemo
//
//  Created by LongBT on 27/6/24.
//

//#import <Foundation/Foundation.h>
//#import "React/RCTBridgeModule.h"
//@interface RCT_EXTERN_MODULE(AsyncStorageModule, NSObject)
//RCT_EXTERN_METHOD(test)
//RCT_EXTERN_METHOD(getAccessToken:(RCTPromiseResolveBlock)resolve
//                             reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(getUserInfo:(RCTPromiseResolveBlock)resolve
//                          reject:(RCTPromiseRejectBlock)reject)
//@end

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

@interface AsyncStorageModule : NSObject <RCTBridgeModule>
@end

@implementation AsyncStorageModule

// Macro for exporting the module to React Native
RCT_EXPORT_MODULE(AsyncStorageModule);

// React Native's threading model requires this method to specify if the module needs to be initialized on the main thread
+ (BOOL)requiresMainQueueSetup {
    return NO;
}

// Example method exposed to React Native
RCT_EXPORT_METHOD(test) {
    NSLog(@"test called");
}

// Method to get an access token, returning a promise
RCT_REMAP_METHOD(getAccessToken, getAccessTokenWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSLog(@"getAccessToken called");
    resolve(@"AccessToken");
}

// Method to get user information, returning a promise
RCT_REMAP_METHOD(getUserInfo, getUserInfoWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSLog(@"getUserInfo called");
    resolve(@"{\"userName\": \"User1\", \"userId\": \"UserID1\", \"email\": \"user1@example.com\"}");
}

@end
