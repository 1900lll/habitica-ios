//
//  HRPGGuildsOverviewViewController.h
//  Habitica
//
//  Created by Phillip Thelen on 05/02/16.
//  Copyright © 2016 Phillip Thelen. All rights reserved.
//

#import "HRPGBaseViewController.h"

@interface HRPGGuildsOverviewViewController
    : HRPGBaseViewController<NSFetchedResultsControllerDelegate>

@property(strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
