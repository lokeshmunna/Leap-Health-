//
//  SignUpViewController.m
//  L+Project
//
//  Created by Vinay Kumar Darna on 05/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import "SignUpViewController.h"
#import "AFNetworking.h"
#import "TabBarViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"BackNavigation.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//   item.tintColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = item;
}

-(void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
  
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    
    textField.layer.masksToBounds = YES;
    
    if (textField == self.location)
    {
        if ([self.passwrd isEqualToString:self.cnfPassword])
        {
            NSLog(@"Both same");
        }
        else
        {
            
              UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Password and Confirm Password are must be same" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: nil];
    
    [alert addAction:ok];
[self presentViewController:alert animated:YES completion:nil];
        
        }
    }
    else
    {
        
    }
    
    return YES;

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.password)
    {
       self.passwrd = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    else if (textField == self.conformPassword)
    {
        self.cnfPassword = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    
    else if (textField == self.mobileNumber)
    {
        self.ValidatemobileNumber = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (self.ValidatemobileNumber.length > 10)
        {
                                         UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Please provide a valid phone number" preferredStyle:UIAlertControllerStyleAlert];
                                         UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: nil];
                                         
                                         [alert addAction:ok];
                                         [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            
        }

    }
    
    return YES;
}



- (IBAction)maleCheckbox:(id)sender {
    
    
    
    if (isMaleSelected) {
        [self.maleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOff.png"] forState:UIControlStateNormal];
       
        [self.femaleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOn.png"] forState:UIControlStateNormal];
         isMaleSelected = NO;
    } else {
        
        [self.maleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOn.png"] forState:UIControlStateNormal];
        selectedGender = @"male";
        [self.femaleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOff.png"] forState:UIControlStateNormal];

        isMaleSelected = YES;
    }
}


- (IBAction)femaleCheckbox:(id)sender {

    
    if (isMaleSelected) {
        [self.femaleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOn.png"] forState:UIControlStateNormal];
        selectedGender = @"female";
        [self.maleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOff.png"] forState:UIControlStateNormal];

        isMaleSelected = NO;
    } else {
        
        [self.femaleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOff.png"] forState:UIControlStateNormal];
        [self.maleCheckBox setBackgroundImage:[UIImage imageNamed:@"radioOn.png"] forState:UIControlStateNormal];

        isMaleSelected = YES;
    }
    
}





- (IBAction)SigninPage:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)SignUp:(id)sender {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSDictionary *signUpDetails = @{@"first_name":self.userNmae.text ,@"mail_id":self.mailId.text,@"password":self.password.text,@"location_other":self.location.text,@"contact":self.mobileNumber.text,@"gender":selectedGender};
    
    [manager POST:@"http://si4.in/leaphealth/webservices/setSignUp" parameters:signUpDetails progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"SignUpDetails is%@",responseObject);
       
         [[NSUserDefaults standardUserDefaults]setValue:[responseObject objectForKey:@"user_id"] forKey:@"UID"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        TabBarViewController *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"TabBarViewController"];
        
            [self.navigationController pushViewController:tabBar animated:YES];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

@end
