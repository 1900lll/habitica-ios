//
//  HRPGMaintenanceViewController.h
//  Habitica
//
//  Created by Phillip Thelen on 28/04/16.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRPGMaintenanceViewController : UIViewController

- (void)setMaintenanceData:(NSDictionary *)data;

@property(nonatomic) BOOL isDeprecatedApp;

@end
