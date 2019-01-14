//
//  ALNavigationController.m
//  Applozic
//
//  Created by Adarsh Kumar Mishra on 12/7/16.
//  Copyright © 2016 applozic Inc. All rights reserved.
//

#import "ALNavigationController.h"
#import "ALApplozicSettings.h"


@implementation ALNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)customNavigationItemClicked:(id)sender withTag:(NSString*)tag{
    ALSLog(ALLoggerSeverityInfo, @"baseController ALNavigationController...");
}

-(NSMutableArray*)getCustomButtons
{
    ALSLog(ALLoggerSeverityInfo, @" Base getCustomButtonView");
    return nil;
}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return [ALApplozicSettings getStatusBarStyle];
}
@end
