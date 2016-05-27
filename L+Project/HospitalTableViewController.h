//
//  HospitalTableViewController.h
//  L+Project
//
//  Created by Vinay Kumar Darna on 09/05/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalTableViewController : UITableViewController


@property(nonatomic, strong) NSMutableArray *hospitalData;

@property(nonatomic, strong) NSMutableArray *hospitaImages;
@property (nonatomic, strong) NSMutableArray *hospitalNames;
@property (nonatomic, strong) NSMutableArray *hospitalRatings;


@end
