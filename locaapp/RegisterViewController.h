//
//  RegisterViewController.h
//  locaapp
//
//  Created by Maciej Królikowski on 27/02/15.
//  Copyright (c) 2015 Maciej Królikowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)register:(id)sender;

@end
