//
//  ViewController.m
//  Rotation test
//
//  Created by Emanuel Carnevale on 28/01/14.
//  Copyright (c) 2014 Mikamai. All rights reserved.
//

#import "ViewController.h"
#import "StickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  StickerView *sticker = [[StickerView alloc] initWithImage:[UIImage imageNamed:@"mikamai.png"]];
  sticker.center = self.view.center;
  [self.view addSubview:sticker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
