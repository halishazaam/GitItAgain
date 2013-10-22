//
//  SeeWordViewController.h
//  Words.2
//
//  Created by Hali on 10/17/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface SeeWordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *shword;
@property (strong, nonatomic) Word *wd;

@end
