//
//  TDAnalyticHelper.m
//  Pods
//
//  Created by geekgy on 15-4-15.
//
//

#import "TDAnalyticHelper.h"
#import <CoreLocation/CoreLocation.h>
#import "IOSSystemUtil.h"
#import "TalkingDataGA.h"

@implementation TDAnalyticHelper

SINGLETON_DEFINITION(TDAnalyticHelper)

#pragma mark - private method

#pragma mark - public method

- (void)setAccoutInfo:(NSDictionary *)dict {
    TDGAAccount* account  = [TDGAAccount setAccount:[TalkingDataGA getDeviceId]];
    NSString* accountName = [dict objectForKey:@"userId"];
    NSString* gender      = [dict objectForKey:@"gender"];
    NSString* age         = [dict objectForKey:@"age"];
    NSString* gameserver  = [dict objectForKey:@"gameserver"];
    [account setAccountType:kAccountRegistered];
    if (accountName != nil) {
        [account setAccountName:accountName];
    }
    if (gender != nil) {
        if ([gender isEqualToString:@"male"]) {
            [account setGender:kGenderMale];
        } else if ([gender isEqualToString:@"female"]) {
            [account setGender:kGenderFemale];
        }
    }
    if (age != nil) {
        [account setAge:[age intValue]];
    }
    if (gameserver != nil) {
        [account setGameServer:gameserver];
    }
}

- (void)onEvent:(NSString *)eventId {
    [self onEvent:eventId Label:@""];
}

- (void)onEvent:(NSString *)eventId Label:(NSString *)label {
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:label forKey:@"key"];
    [self onEvent:eventId eventData:userInfo];
}

- (void)onEvent:(NSString *)eventId eventData:(NSDictionary *)userInfo {
    [TalkingDataGA onEvent:eventId eventData:userInfo];
}

- (void)setLevel:(int)level {
    TDGAAccount* account = [TDGAAccount setAccount:[TalkingDataGA getDeviceId]];
    [account setLevel:level];
}

- (void)charge:(NSString *)name :(double)cash :(double)coin :(int)type {
    long long timemills = [[NSDate date] timeIntervalSince1970];
    NSString *deviceId = [TalkingDataGA getDeviceId];
    int r = arc4random_uniform(10 + 1);
    NSString *orderId = [NSString stringWithFormat:@"%@-%lld-%d", deviceId, timemills, r];
    [TDGAVirtualCurrency onChargeRequst:orderId
                                  iapId:name
                         currencyAmount:cash
                           currencyType:@"CNY"
                  virtualCurrencyAmount:coin
                            paymentType:[NSString stringWithFormat:@"%d", type]];
    [TDGAVirtualCurrency onChargeSuccess:orderId];
}

- (void)reward:(double)coin :(int)type {
    [TDGAVirtualCurrency onReward:coin reason:[NSString stringWithFormat:@"%d", type]];
}

- (void)purchase:(NSString *)name :(int)amount :(double)coin {
    [TDGAItem onPurchase:name itemNumber:amount priceInVirtualCurrency:coin];
}

- (void)use:(NSString *)name :(int)amount :(double)coin {
    [TDGAItem onUse:name itemNumber:amount];
}

- (void)missionStart:(NSString *)missionId {
    [TDGAMission onBegin:missionId];
}

- (void)missionSuccess:(NSString *)missionId {
    [TDGAMission onCompleted:missionId];
}

- (void)missionFailed:(NSString *)missionId because:(NSString *)reason {
    [TDGAMission onFailed:missionId failedCause:reason];
}

#pragma mark - LifeCycleDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *key     = [[IOSSystemUtil getInstance] getConfigValueWithKey:TALKINGDATA_KEY];
    NSString *channel = [[IOSSystemUtil getInstance] getConfigValueWithKey:TALKINGDATA_CHANNAL];
    [TalkingDataGA onStart:key withChannelId:channel];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager startUpdatingLocation];
    CLLocation *location = locationManager.location;
    [TalkingDataGA setLatitude:location.coordinate.latitude
                     longitude:location.coordinate.longitude];
    if ([TalkingDataGA handleTDGAPushMessage:launchOptions]) {
//        [[IOSSystemUtil getInstance] showMessage:@"launch"];
    }
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [TalkingDataGA setDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if ([TalkingDataGA handleTDGAPushMessage:userInfo]) {
//        [[IOSSystemUtil getInstance] showMessage:@"running"];
    }
}

@end




