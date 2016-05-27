//
//  AppDelegate.h
//  L+Project
//
//  Created by Vinay Kumar Darna on 04/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

