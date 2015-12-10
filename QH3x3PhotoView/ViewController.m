//
//  ViewController.m
//  QH3x3PhotoView
//
//  Created by Chie Li on 15/12/9.
//  Copyright © 2015年 ChieLi. All rights reserved.
//

#import "ViewController.h"
#import "QH3x3PhotoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    UIImage *image1 = [UIImage imageNamed:@"1.jpeg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpeg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpeg"];
    UIImage *image4 = [UIImage imageNamed: @"4.jpeg"];
    UIImage *image5 = [UIImage imageNamed:@"5.jpeg"];
    UIImage *image6 = [UIImage imageNamed:@"6.jpeg"];
    UIImage *image7 = [UIImage imageNamed:@"7.jpeg"];
    UIImage *image8 = [UIImage imageNamed:@"8.jpeg"];
    UIImage *image9 = [UIImage imageNamed:@"9.jpeg"];
    
    
    NSArray *imageArray = @[image1, image2, image3, image4, image5, image6, image7, image8, image9];
    
    QH3x3PhotoView *photoView = [[QH3x3PhotoView alloc] init];
    [photoView bindImageArray:imageArray];
    [self.view addSubview:photoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
