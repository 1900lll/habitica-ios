//
//  HRPGNetworkIndicatorController.m
//  Habitica
//
//  Created by Phillip Thelen on 15/05/14.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import "HRPGNetworkIndicatorController.h"

@interface HRPGNetworkIndicatorController ()
@property NSInteger networkCount;
@end

@implementation HRPGNetworkIndicatorController

- (void)beginNetworking {
    if (self.networkCount == 0) {
        [self performSelectorOnMainThread:@selector(showIndicator) withObject:self waitUntilDone:NO];
    }
    self.networkCount++;
}

- (void)endNetworking {
    self.networkCount--;
    if (self.networkCount == 0) {
        [self performSelectorOnMainThread:@selector(hideIndicator) withObject:self waitUntilDone:NO];
    } else if (self.networkCount < 0) {
        self.networkCount = 0;
    }
}

- (void)showIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


- (void)hideIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
