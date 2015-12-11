//
//  Menu.h
//  Gioco_prova
//
//  Created by Marco Marazzi on 05/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ViewController.h"

@interface Menu : UIViewController{
    
    IBOutlet UILabel *menu;
    
    IBOutlet UIButton *indietro;

    IBOutlet UIButton *info;
    
    NSTimer *__posiziona;
    
    
    IBOutlet UILabel *labelMusic;
    IBOutlet UIImageView *imgMusic;
    IBOutlet UISlider *sliderMusic;
    
    IBOutlet UILabel *labelSound;
    IBOutlet UIImageView *imgSound;
    IBOutlet UISlider *sliderSound;
    
    IBOutlet UILabel *labelMode;
    IBOutlet UISegmentedControl *controlMode;
    
    NSInteger musicvalue;
    NSInteger soundvalue;
    
   
}


@property(nonatomic,retain) IBOutlet UILabel *menu;
@property(nonatomic,retain) IBOutlet UIButton *indietro;
@property(nonatomic,retain) IBOutlet UIButton *info;
@property(nonatomic,retain) NSTimer *__posiziona;

@property(nonatomic,retain) IBOutlet UILabel *labelMusic;
@property(nonatomic,retain) IBOutlet UIImageView *imgMusic;
@property(nonatomic,retain) IBOutlet UISlider *sliderMusic;
@property(nonatomic,retain) IBOutlet UILabel *labelSound;
@property(nonatomic,retain) IBOutlet UIImageView *imgSound;
@property(nonatomic,retain) IBOutlet UISlider *sliderSound;
@property(nonatomic,retain) IBOutlet UILabel *labelMode;
@property(nonatomic,retain) IBOutlet UISegmentedControl *controlMode;

@property(nonatomic) NSInteger musicvalue;
@property(nonatomic) NSInteger soundvalue;
@end
