//
//  TDAddWordViewController.h
//  Words.2
//
//  Created by Hali on 10/16/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WordProtocol <NSObject>
-(void) wordSaved;
-(void) canceled;

@end

@interface TDAddWordViewController : UIViewController

@property (strong,nonatomic) id <WordProtocol> delegate;
@property (strong, nonatomic) IBOutlet UITextField *tdhword;
@property (strong, nonatomic) IBOutlet UITextField *tdfpro;
@property (strong, nonatomic) IBOutlet UITextField *tdedef;
@property (strong, nonatomic) IBOutlet UITextField *source;

- (IBAction)saveButtonClicked:(id)sender;


@end
