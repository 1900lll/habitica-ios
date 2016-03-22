//
//  HRPGCopyTableViewCell.m
//  Habitica
//
//  Created by Phillip Thelen on 18/10/15.
//  Copyright © 2015 Phillip Thelen. All rights reserved.
//

#import "HRPGCopyTableViewCell.h"

@implementation HRPGCopyTableViewCell

- (void)copy:(id)sender {
    NSString *text = self.detailTextLabel.text;
    if (text) {
        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
        pboard.string = text;
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copy:));
}

- (void)selectedCell {
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
