/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "CDVYandexmaps.h"
#import <Cordova/CDV.h>
#import <Foundation/NSURL.h>
#import <Foundation/Foundation.h>

@implementation Yandexmaps

- (void)open: (CDVInvokedUrlCommand*)command {
    NSString *lat_from = [NSString stringWithFormat:@"%@", [command argumentAtIndex:0]];
    NSString *lon_from = [NSString stringWithFormat:@"%@", [command argumentAtIndex:1]];
    NSString *lat_to = [NSString stringWithFormat:@"%@", [command argumentAtIndex:2]];
    NSString *lon_to = [NSString stringWithFormat:@"%@", [command argumentAtIndex:3]];

    NSString *from = @"";
    if([lat_from length] != 0 && [lon_from length] != 0)
		from = [NSString stringWithFormat: @"lat_from=%@&lon_from=%@&", lat_from, lon_from];

    // Попытка запуска Яндекс.Навигатор
    // NSString* webStringURL2 = [NSString stringWithFormat: @"yandexnavi://build_route_on_map?%@lat_to=%@&lon_to=%@", from, lat_to, lon_to];
    NSString* webStringURL2 = [NSString stringWithFormat: @"yandexnavi://build_route_on_map?lat_to=%@&lon_to=%@", lat_to, lon_to];
    NSURL* naviURL2 = [NSURL URLWithString:webStringURL2];
    if ([[UIApplication sharedApplication] canOpenURL:naviURL2]) {
        [[UIApplication sharedApplication] openURL:naviURL2];
    } else {
        // Попытка запуска Яндекс.Карты
        NSString* webStringURL1 = [NSString stringWithFormat: @"yandexmaps://maps.yandex.ru/?rtext=%@,%@~%@,%@&rtt=auto", lat_from, lon_from, lat_to, lon_to];
        NSURL* naviURL1 = [NSURL URLWithString:webStringURL1];
        if ([[UIApplication sharedApplication] canOpenURL:naviURL1]) {
            [[UIApplication sharedApplication] openURL:naviURL1];
        } else {
			// Попытка запуска Apple.Maps
			NSString* webStringURL3 = [NSString stringWithFormat: @"http://maps.apple.com/?daddr=%@,%@", lat_to, lon_to];
			NSURL* naviURL3 = [NSURL URLWithString:webStringURL3];
			if ([[UIApplication sharedApplication] canOpenURL:naviURL3]) {
				[[UIApplication sharedApplication] openURL:naviURL3];
			} else {
				// Предлагаем установить Яндекс.Карты
				NSURL* appStoreURL = [NSURL URLWithString:@"https://itunes.apple.com/ru/app/yandex.maps/id313877526?mt=8"];
				[[UIApplication sharedApplication] openURL:appStoreURL];
			}
		}
	}
}

@end
