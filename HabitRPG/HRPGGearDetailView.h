//
//  HRPGGearDetailView.h
//  Habitica
//
//  Created by Phillip Thelen on 20/09/15.
//  Copyright © 2015 Phillip Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetaReward.h"
#import "ShopItem+CoreDataClass.h"

@interface HRPGGearDetailView : UIView

@property(weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *currencyImageView;
@property(weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@property(weak, nonatomic) IBOutlet UIButton *dismissButton;
@property(weak, nonatomic) IBOutlet UIButton *buyButton;
@property(weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property(nonatomic) NSString *descriptionText;
- (void)configureForReward:(MetaReward *)reward withGold:(CGFloat)gold;
- (void)configureForShopItem:(ShopItem *)item withCurrencyAmount:(CGFloat)currencyAmount;

@property(nonatomic, copy) void (^buyAction)();

@end
