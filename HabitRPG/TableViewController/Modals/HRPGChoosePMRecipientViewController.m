//
//  HRPGChoosePMRecipientViewController.m
//  Habitica
//
//  Created by Phillip Thelen on 09/08/16.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import "HRPGChoosePMRecipientViewController.h"
#import "UIColor+Habitica.h"
#import "HRPGQRCodeScannerViewController.h"
#import "NSString+UUID.h"
#import "Habitica-Swift.h"

@interface HRPGChoosePMRecipientViewController ()

@property XLFormRowDescriptor *usernameFormRow;

@end

@implementation HRPGChoosePMRecipientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XLFormDescriptor *formDescriptor =
    [XLFormDescriptor formDescriptorWithTitle:NSLocalizedString(@"Recipient", nil)];
    formDescriptor.assignFirstResponderOnShow = YES;
    
    self.form = formDescriptor;
    
    XLFormSectionDescriptor *section;
    
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    self.usernameFormRow = [XLFormRowDescriptor
           formRowDescriptorWithTag:@"username"
           rowType:XLFormRowDescriptorTypeText];
    self.usernameFormRow.title = NSLocalizedString(@"Username", nil);
    [self.usernameFormRow.cellConfig setObject:[UIColor purple400] forKey:@"self.tintColor"];
    [section addFormRow:self.usernameFormRow];
    [formDescriptor addFormSection:section];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"SelectedRecipientSegue"]) {
        id username = self.formValues[@"username"];
        if (username == [NSNull null]) {
            HabiticaAlertController *alertController = [HabiticaAlertController genericErrorWithMessage:NSLocalizedString(@"You have to specify a valid Habitica Username as recipient.", nil) title:NSLocalizedString(@"Invalid Habitica Username", nil)];
            [alertController show];
            return NO;
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SelectedRecipientSegue"]) {
        self.username = self.formValues[@"username"];
    }
}


@end
