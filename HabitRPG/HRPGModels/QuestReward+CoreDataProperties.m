//
//  QuestReward+CoreDataProperties.m
//  Habitica
//
//  Created by Phillip on 28.08.17.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import "QuestReward+CoreDataProperties.h"

@implementation QuestReward (CoreDataProperties)

+ (NSFetchRequest<QuestReward *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"QuestReward"];
}

@dynamic key;
@dynamic onlyOwner;
@dynamic text;
@dynamic type;
@dynamic quest;

@end
