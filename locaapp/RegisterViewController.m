//
//  RegisterViewController.m
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import "RegisterViewController.h"
#import "HTAppService.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)register:(id)sender {
    [[HTAppService sharedManager]registerWithName:_nameTextField.text withCompletion:^(User *user, NSError *error) {
        if(error == nil) {
           NSLog(@"%@", user.name);
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *filePath = [documentsDirectory stringByAppendingPathComponent: @"userInfo.bin"];
            
            [NSKeyedArchiver archiveRootObject:user toFile:filePath];
            User *tUser = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
            
            [self performSegueWithIdentifier:@"registerSuccess" sender:nil];
            
        } else {
           NSLog(@"errro");
        }
        
    }];
}
@end
