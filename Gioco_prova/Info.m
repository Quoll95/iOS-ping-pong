//
//  Info.m
//  Gioco_prova
//
//  Created by Marco Marazzi on 06/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import "Info.h"
#import "Menu.h"
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Info ()

@end

#define sizey [[UIScreen mainScreen] bounds].size.height
#define sizex [[UIScreen mainScreen] bounds].size.width


@implementation Info

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)Indietro:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}




-(void)Posiziona{
    info.frame=CGRectMake((sizex-info.frame.size.width)/2, 17, sizex/2.73, sizey/12.31);
    indietro.frame=CGRectMake(18, info.frame.size.height+info.frame.origin.y-indietro.frame.size.height, 40, 40);
    text.frame=CGRectMake(sizex/5.46, sizey/4.29, sizex/1.40, sizey/1.55);
    text.editable=NO;
}


@synthesize info,indietro,text;

@end
