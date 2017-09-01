//
//  HRPGUserTopHeader.h
//  Habitica
//
//  Created by viirus on 12.03.15.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRPGManager.h"
#import "User.h"

@interface HRPGUserTopHeader : UIView<NSFetchedResultsControllerDelegate>

@property NSArray *selectedTags;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
