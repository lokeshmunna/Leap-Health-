//
//  ViewController.m
//  L+Project
//
//  Created by Vinay Kumar Darna on 04/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"
#import "TabBarViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];
    // [START_EXCLUDE silent]
       
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, self.sigininUsernameText.frame.size.height - borderWidth, self.sigininUsernameText.frame.size.width, self.sigininUsernameText.frame.size.height);
    
    border.borderWidth = borderWidth;
    [self.sigininUsernameText.layer addSublayer:border];
    
    self.sigininUsernameText.layer.masksToBounds = YES;
    
    
    CALayer *border2 = [CALayer layer];
    CGFloat border2Width = 1;
    border2.borderColor = [UIColor whiteColor].CGColor;
    border2.frame = CGRectMake(0, self.sigininPasswordtext.frame.size.height - border2Width, self.sigininPasswordtext.frame.size.width, self.sigininPasswordtext.frame.size.height);
    
    border2.borderWidth = border2Width;
    [self.sigininPasswordtext.layer addSublayer:border2];
    
    self.sigininPasswordtext.layer.masksToBounds = YES;
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    // Optional: Place the button in the center of your view.
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
//    loginButton.readPermissions =
//    @[@"public_profile", @"email", @"user_friends"];
    
}



// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipLogin:(id)sender {
}

- (IBAction)forgetPassword:(id)sender {
}

- (IBAction)siginIn:(id)sender {
}

- (IBAction)faceBook:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
    
}

- (IBAction)google:(id)sender {
   
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signInSilently];
    
    
}

- (IBAction)signUp:(id)sender {
    
    SignUpViewController *signup = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:signup animated:YES];
    
}

- (IBAction)GoToTabBar:(id)sender {
    
    TabBarViewController *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"TabBarViewController"];
    
    [self.navigationController pushViewController:tabBar animated:YES];

}


@end
