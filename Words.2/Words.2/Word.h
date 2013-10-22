//
//  Word.h
//  Words.2
//
//  Created by Hali on 10/16/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) NSString * hword;
@property (nonatomic, retain) NSString * edef;
@property (nonatomic, retain) NSString * fpro;
@property (nonatomic, retain) NSString * source;

@end
