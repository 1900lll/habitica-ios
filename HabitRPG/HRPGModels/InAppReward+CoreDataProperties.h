//
//  InAppReward+CoreDataProperties.h
//  Habitica
//
//  Created by Phillip on 18.09.17.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//
//

#import "InAppReward+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface InAppReward (CoreDataProperties)

+ (NSFetchRequest<InAppReward *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *currency;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nullable, nonatomic, copy) NSNumber *isSuggested;
@property (nullable, nonatomic, copy) NSNumber *locked;
@property (nullable, nonatomic, copy) NSString *path;
@property (nullable, nonatomic, copy) NSString *pinType;
@property (nullable, nonatomic, copy) NSString *purchaseType;
@property (nullable, nonatomic, copy) NSDate *lastPurchased;

@end

NS_ASSUME_NONNULL_END
