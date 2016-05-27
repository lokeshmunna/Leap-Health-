//
//  HealthTipsViewController.m
//  L+Project
//
//  Created by Vinay Kumar Darna on 08/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import "HealthTipsViewController.h"
#import "AFNetworking.h"


@interface HealthTipsViewController ()

@end

@implementation HealthTipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:@"http://si4.in/leaphealth/webservices/getHealthtips" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Hospital data is %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error is %@",error);
    }];

    // Do any additional setup after loading the view.
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

@end
