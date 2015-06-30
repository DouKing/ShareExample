//
//  ViewController.m
//  ShareExample
//
//  Created by WuYikai on 15/6/30.
//  Copyright (c) 2015年 secoo. All rights reserved.
//

#import "ViewController.h"
#import "CustomActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)share:(UIButton *)sender {
  NSString *textToShare = @"大家好，这是分享内容";
  UIImage *imageToShare = [UIImage imageNamed:@"IMG_0404"];
  NSURL *urlToShare = [NSURL URLWithString:@"http://8386217.blog.51cto.com/8376217/1592512"];
  NSArray *activityItems = @[textToShare, imageToShare, urlToShare];
  UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
  activityVC.excludedActivityTypes = @[UIActivityTypePrint];
  [self presentViewController:activityVC animated:YES completion:^{
    
  }];
}

- (IBAction)action:(UIButton *)sender {
  NSURL *urlToShare = [NSURL URLWithString:@"http://8386217.blog.51cto.com/8376217/1592512"];
  NSArray *activityItems = @[urlToShare];
  CustomActivity *customActivity = [CustomActivity new];
  NSArray *applicationActivities = @[customActivity];
  UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:applicationActivities];
  [self presentViewController:activityVC animated:YES completion:^{
    
  }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
