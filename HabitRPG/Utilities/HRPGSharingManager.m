//
//  HRPGSharingManager.m
//  Habitica
//
//  Created by Phillip Thelen on 25/04/16.
//  Copyright © 2016 Phillip Thelen. All rights reserved.
//

#import "HRPGSharingManager.h"

@implementation HRPGSharingManager

+ (void)shareItems:(NSArray *)items
withPresentingViewController:(UIViewController *)presentingViewController
    withSourceView:(UIView *)sourceView{
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    if ( [activityViewController respondsToSelector:@selector(popoverPresentationController)] ) {
        // iOS8
        if (sourceView) {
            activityViewController.popoverPresentationController.sourceView = sourceView;
        } else {
            activityViewController.popoverPresentationController.sourceView = presentingViewController.view;
        }
    }
    [presentingViewController presentViewController:activityViewController
                                           animated:YES
                                         completion:nil];
}

@end
