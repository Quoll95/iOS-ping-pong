//
//  Menu.m
//  Gioco_prova
//
//  Created by Marco Marazzi on 05/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import "Menu.h"
#import "ViewController.h"
#import "Info.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>


@interface Menu ()

@end


#define sizey [[UIScreen mainScreen] bounds].size.height
#define sizex [[UIScreen mainScreen] bounds].size.width



@implementation Menu

- (void)viewDidLoad {
    [super viewDidLoad];
    __posiziona= [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];

}



- (IBAction)Indietro:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
    }

- (IBAction)Info:(id)sender {
    Info* _info_=[[Info alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:_info_ animated:YES completion:NULL];
}







-(void)Posiziona{
    menu.frame=CGRectMake((sizex-menu.frame.size.width)/2, 17, sizex/2.73, sizey/12.31);
    indietro.frame=CGRectMake(18, menu.frame.size.height+menu.frame.origin.y-indietro.frame.size.height, 40, 40);
    info.frame=CGRectMake(sizex-48, menu.frame.size.height+menu.frame.origin.y-info.frame.size.height-6, 22, 22);
    labelMusic.frame=CGRectMake(20, sizey/4.40, 52, 24);
    imgMusic.frame=CGRectMake(20, sizey/3.77, sizex/9.37, sizey/16.625);
    sliderMusic.frame=CGRectMake(sizex/4, sizey/3.674, sizex/1.51, 30);
    labelSound.frame=CGRectMake(20, sizey/2.80, 61, 24);
    imgSound.frame=CGRectMake(20, sizey/2.5, sizex/9.37, sizey/16.625);
    sliderSound.frame=CGRectMake(sizex/4, sizey/2.45, sizex/1.51, 30);
    labelMode.frame=CGRectMake(20, sizey/1.79, 73, sizey/17.5);
    controlMode.frame=CGRectMake(sizex/2.72, sizey/1.76, sizex/2.35, 28);
    }





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@synthesize menu,indietro,info,__posiziona,labelMode,labelMusic,labelSound,imgMusic,imgSound,sliderMusic,sliderSound,controlMode,musicvalue,soundvalue;


@end
