//
//  ViewController.h
//  L+Project
//
//  Created by Vinay Kumar Darna on 04/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <GIDSignInUIDelegate>

@property (strong, nonatomic) IBOutlet UITextField *sigininUsernameText;
@property (strong, nonatomic) IBOutlet UITextField *sigininPasswordtext;

- (IBAction)skipLogin:(id)sender;

- (IBAction)forgetPassword:(id)sender;

- (IBAction)siginIn:(id)sender;

- (IBAction)faceBook:(id)sender;

- (IBAction)google:(id)sender;

- (IBAction)signUp:(id)sender;

@end

