//
//  HRPGLoadingViewController.h
//  Habitica
//
//  Created by Phillip Thelen on 19/09/15.
//  Copyright (c) 2015 Phillip Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRPGLoadingViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property UIImageView *logo;
@property NSMutableArray *squares;
@property NSInteger lineCount;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, copy) void (^loadingFinishedAction)();

@end
