//
//  SignUpViewController.h
//  L+Project
//
//  Created by Vinay Kumar Darna on 05/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate> {
    
    
 BOOL isMaleSelected;
    NSString * selectedGender;
}
@property (strong, nonatomic) IBOutlet UIButton *maleCheckBox;

@property (strong, nonatomic) IBOutlet UIButton *femaleCheckBox;

@property (strong, nonatomic) IBOutlet UITextField *userNmae;

@property (strong, nonatomic) IBOutlet UITextField *mailId;

@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UITextField *conformPassword;

@property (strong, nonatomic) IBOutlet UITextField *location;

@property (strong, nonatomic) IBOutlet UITextField *mobileNumber;

@property (strong, nonatomic) NSString * passwrd;

@property (strong, nonatomic) NSString * cnfPassword;

@property (strong, nonatomic) NSString * ValidatemobileNumber;
@property (strong, nonatomic) NSString * UID;

- (IBAction)maleCheckbox:(id)sender;

- (IBAction)femaleCheckbox:(id)sender;

- (IBAction)SigninPage:(id)sender;

- (IBAction)SignUp:(id)sender;



@end
