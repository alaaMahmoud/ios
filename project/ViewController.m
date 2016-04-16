//
//  ViewController.m
//  project
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ViewController.h"
#import "ZXingObjC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.textView.text = @"http://github.com/TheLevelUp/ZXingObjC";
    [self update:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)update:(id)sender {
    
    [self.textView resignFirstResponder];
    
    NSString *data = self.textView.text;
    if (data == 0) return;
    
    ZXMultiFormatWriter *writer = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [writer encode:data
                                  format:kBarcodeFormatQRCode
                                   width:self.imageView.frame.size.width
                                  height:self.imageView.frame.size.width
                                   error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        self.imageView.image = [UIImage imageWithCGImage:image.cgimage];
    } //else {
      //  self.imageView.image = nil;
    //}

}
@end
