//
//  TDAddWordViewController.m
//  Words.2
//
//  Created by Hali on 10/16/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import "TDAddWordViewController.h"
#import "AppDelegate.h"
#import "Word.h"    
#import "TDViewController.h"

@interface TDAddWordViewController ()
@end

@implementation TDAddWordViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButtonClicked:(id)sender {
    [self saveWord];
    [self.delegate wordSaved];
   
    
    NSLog(@"gotosave");
    [self.navigationController popViewControllerAnimated:YES];


}

- (IBAction)cancelButtonClicked:(id)sender {
    NSLog(@"gotocancel");
    [self.delegate canceled];
    //[self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)saveWord{
    NSLog(@"goingtoSaveWord");
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.managedObjectContext;
    Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc];
    [word setHword:self.tdhword.text];
//    [word setHword:self.tdhword.text];
    /* add the rest of the items as above
           word.hword = self.tdhword.text;
           word.fpro = self.tdfpro.text;
            word.edef = self.tdedef.text;
            word.source= self.source.text; 
    */
           NSError *error;
           if ([moc save:&error]){
               NSLog(@"Nope, Didn't work :/");
           }
}
@end
