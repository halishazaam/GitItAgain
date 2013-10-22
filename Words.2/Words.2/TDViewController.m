//
//  TDViewController.m
//  Words.2
//
//  Created by Hali on 10/16/13.
//  Copyright (c) 2013 Houma Language Project. All rights reserved.
//

#import "TDViewController.h"
#import "AppDelegate.h"
#import "Word.h"
#import "TDAddWordViewController.h"
#import "SeeWordViewController.h"


@interface TDViewController ()
@property(nonatomic,weak)AppDelegate *delegate;
@property(nonatomic,strong)NSArray *words;
@end

@implementation TDViewController

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

    NSString *pointtodir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *storePath= [pointtodir stringByAppendingPathComponent:@"Words_2.sqlite"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:storePath]){
        [self addInitialWords];
    }
    
    
    self.delegate = [[UIApplication sharedApplication] delegate];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{NSLog(@"loadData");
    NSManagedObjectContext *moc = self.delegate.managedObjectContext;
    NSFetchRequest *fr = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
    NSError *error;
    NSSortDescriptor *alphabetize = [[NSSortDescriptor alloc] initWithKey:@"hword" ascending:YES];
    [fr setSortDescriptors:@[alphabetize]];
    self.words = [moc executeFetchRequest:fr error:&error];
    //[self wordSaved];
    [self.tableView reloadData];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.words count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CellID";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    
    Word *w = [self.words objectAtIndex:indexPath.row];
    
    cell.textLabel.text = w.hword;
    return cell;
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{NSLog(@"seque");
    if ([segue.identifier isEqualToString:@"addWord"]){
        TDAddWordViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        
    
    }
    else if ([segue.identifier isEqualToString:@"seeWord"]){
        UITableViewCell *cell = (UITableViewCell *) sender;
        NSIndexPath *path =[self.tableView indexPathForCell:cell];
        Word *wd = [self.words objectAtIndex:path.row];
        
        
        SeeWordViewController *vc = [segue destinationViewController];
        vc.wd = wd;
    }
}

-(void)addInitialWords
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.managedObjectContext;
    Word *newWord = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc];
    NSError *error;
    
    [newWord setHword:@"koncak"];
    [newWord setEdef:@"knife"];
    
    if ([moc save:&error]){
        NSLog(@"Nope, Didn't work :/");
    }
    
    newWord = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc];
    [newWord setHword:@"knife"];
    [newWord setEdef:@"That stabby thing"];
    
    if ([moc save:&error]){
        NSLog(@"Nope, Didn't work :/");
    }
    
    newWord = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:moc];

    [newWord setHword:@"knife"];
    [newWord setEdef:@"That stabby thing"];
    
    if ([moc save:&error]){
        NSLog(@"Nope, Didn't work :/");
    }
    
    return;
}

-(void)wordSaved
{
    NSLog(@"wordSaved");
 //   [self dismissViewControllerAnimated:YES completion:^{
        [self loadData];
      //  [self.tableView reloadData];
   //     }];
    
    
}
-(void) canceled{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"TDViewController canceled");
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{NSLog(@"deleting word");
    if (editingStyle == UITableViewCellEditingStyleDelete){
        Word *deleteWord = [self.words objectAtIndex:indexPath.row];
        NSManagedObjectContext *moc = self.delegate.managedObjectContext;
        [moc deleteObject: deleteWord];
        NSError *error;
    
    
        if ([moc save:&error]){
            NSLog(@"Error while deleteing."); 
        }
        [self loadData];
        
        //[self.tableView RowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}


@end
