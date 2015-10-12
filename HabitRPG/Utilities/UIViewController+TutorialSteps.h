//
//  UIViewController+TutorialSteps.h
//  Habitica
//
//  Created by Phillip Thelen on 11/10/15.
//  Copyright © 2015 Phillip Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRPGManager.h"

@interface UIViewController (TutorialSteps)

@property NSString *tutorialIdentifier;
@property NSArray *coachMarks;
@property BOOL displayedTutorialStep;

- (void)displayTutorialStep:(HRPGManager *)sharedManager;

@end
