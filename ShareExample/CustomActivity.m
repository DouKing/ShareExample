//
//  CustomActivity.m
//  ShareExample
//
//  Created by WuYikai on 15/6/30.
//  Copyright (c) 2015年 secoo. All rights reserved.
//

#import "CustomActivity.h"

@implementation CustomActivity
- (NSString *)activityType {
  return NSStringFromClass([self class]);
}

- (NSString *)activityTitle {
  return NSLocalizedStringFromTable(@"Open", @"CustomActivity", nil);
}

- (UIImage *)activityImage {
  return [UIImage imageNamed:@"IMG_0404"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
  for (id activityItem in activityItems) {
    if ([activityItem isKindOfClass:[NSURL class]]) {
      if ([[UIApplication sharedApplication] canOpenURL:activityItem]) {
        return YES;
      }
    }
  }
  return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
  for (id activityItem in activityItems) {
    if ([activityItem isKindOfClass:[NSURL class]]) {
      _url = activityItem;
    }
  }
}

- (void)performActivity {
  BOOL completed = [[UIApplication sharedApplication] openURL:_url];
  [self activityDidFinish:completed];
}

@end
