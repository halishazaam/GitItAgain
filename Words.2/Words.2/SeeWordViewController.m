//
//  SeeWordViewController.m
//  Words.2
//
//  Created by Hali on 10/17/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import "SeeWordViewController.h"
#import "AppDelegate.h"
#import "Word.h"



@interface SeeWordViewController ()

@end

@implementation SeeWordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shword.text= self.wd.hword;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)seeWord{
    NSLog(@"goingtoSeeWord");
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.managedObjectContext;
    Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc];
        _shword.text = word.hword;
}



@end
