//
//  RootViewController.m
//  加密解密
//
//  Created by apple on 14-9-22.
//  Copyright (c) 2014年 小灰灰的苹果军团. All rights reserved.
//

#import "RootViewController.h"
#import "AESCrypt.h"

#define PassWordKey @"key"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *BeforeEncryptTxt;
@property (weak, nonatomic) IBOutlet UILabel *AfterEncryptLab;
@property (weak, nonatomic) IBOutlet UILabel *AfterDecryptLab;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

- (void)hideKeyboard {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - AES_Encrypt
- (IBAction)encrypt:(id)sender {
    NSString *encryptStr = [AESCrypt encrypt:_BeforeEncryptTxt.text password:PassWordKey];
    _AfterEncryptLab.text = encryptStr;
}

#pragma mark - AES_Decrypt
- (IBAction)decrypt:(id)sender {
    NSString *decryptStr = [AESCrypt decrypt:_AfterEncryptLab.text password:PassWordKey];
    _AfterDecryptLab.text = decryptStr;
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
