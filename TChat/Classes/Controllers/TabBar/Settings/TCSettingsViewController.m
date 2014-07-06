//
//  YCSettingsViewController.m
//  YChat
//
//  Created by SWATI KIRVE on 05/07/2014.
//  Copyright (c) 2014 sharaai. All rights reserved.
//

#import "TCSettingsViewController.h"
#import "TCAppDelegate.h"
#import "TCLoginViewController.h"

@interface TCSettingsViewController ()

@end

@implementation TCSettingsViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutNotificationAction) name:@"logoutNotification" object:nil];
    
   // [logoutButton setHidden:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_activityIndicatorView setHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutAction:(UIButton *)sender
{
    [_activityIndicatorView setHidden:NO];
    [_activityIndicatorView startAnimating];
    [XAppDelegate doLogout];
}

-(void)logoutNotificationAction{
    [self restartLogin];
   // [self performSelector:@selector(restartLogin) withObject:nil afterDelay:3];
    
}

-(void)restartLogin{
    //[HUD hide:YES];
    [XAppDelegate prepareXmppChat];
    
    [_activityIndicatorView setHidden:YES];
    [_activityIndicatorView stopAnimating];
    
    TCLoginViewController *loginViewController=[[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"loginView"]; //or the homeController
    XAppDelegate.navController =[[UINavigationController alloc]initWithRootViewController:loginViewController];
    [XAppDelegate.window setRootViewController:XAppDelegate.navController];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end