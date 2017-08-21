//
//  HRPGCollectionViewController.h
//  Habitica
//
//  Created by Elliot Schrock on 7/31/17.
//  Copyright © 2017 Phillip Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HRPGTopHeaderNavigationController;

@interface HRPGCollectionViewController : UICollectionViewController

@property (nonatomic, readonly) HRPGTopHeaderNavigationController *topHeaderNavigationController;

@end
