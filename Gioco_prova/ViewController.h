//
//  ViewController.h
//  Gioco_prova
//
//  Created by Marco Marazzi on 02/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Menu.h"


@interface ViewController : UIViewController{
    
    IBOutlet UIImageView *barraUno;
    IBOutlet UIImageView *barraDue;
    IBOutlet UIImageView *pallina;
    
    IBOutlet UIButton *textIniziale;
    IBOutlet UILabel *puntiUno;
    IBOutlet UILabel *puntiDue;
    
    IBOutlet UIButton *pause;
    
    IBOutlet UIButton *buttonD;
    IBOutlet UIButton *buttonS;
        
    NSInteger statoPartita;
    CGPoint velocitaPalla;
    
    NSInteger premutoD;
    NSInteger premutoS;
    
    NSTimer *prova;
    NSTimer *prova2;
    NSTimer *_musica;
    
    IBOutlet UIButton *indietro;
    
    NSInteger dx;
    
    NSInteger puntiU;
    NSInteger puntiD;
    NSInteger sizebarra;
    NSInteger sizebarra_2;
    NSInteger premutoC_D;
    NSInteger premutoC_S;
    
    IBOutlet UIButton *computerD;
    
    IBOutlet UIButton *computerS;
    
    AVAudioPlayer *backgroundMusic;
    AVAudioPlayer *sound;
    

    IBOutlet UIButton *unmute;
    IBOutlet UIButton *mute;
    

    
}
-(void)gameLoop;

@property (nonatomic, retain) IBOutlet UIImageView *barraUno;
@property (nonatomic, retain) IBOutlet UIImageView *barraDue;
@property (nonatomic, retain) IBOutlet UIImageView *pallina;
@property (nonatomic, retain) IBOutlet UIButton *textIniziale;
@property (nonatomic, retain) IBOutlet UILabel *puntiUno;
@property (nonatomic, retain) IBOutlet UILabel *puntiDue;


@property (nonatomic) NSInteger statoPartita;
@property (nonatomic) CGPoint velocitaPalla;
@property(nonatomic,retain) IBOutlet UIButton *pause;

@property (nonatomic) NSInteger premutoD;
@property (nonatomic) NSInteger premutoS;
@property (nonatomic) NSInteger premutoC_D;
@property (nonatomic) NSInteger premutoC_S;
@property (nonatomic) NSInteger dx;

@property (nonatomic) NSTimer *prova;
@property (nonatomic) NSTimer *prova2;

@property (nonatomic) NSTimer *_musica;

@property (nonatomic,retain) IBOutlet UIButton *buttonD;
@property (nonatomic,retain) IBOutlet UIButton *buttonS;

@property (nonatomic,retain) IBOutlet UIButton *indietro;
@property (nonatomic) NSInteger sizebarra;
@property (nonatomic) NSInteger sizebarra_2;

@property (nonatomic, retain) IBOutlet UIButton *menu;

@property (nonatomic,retain) IBOutlet UIButton *computerD;
@property (nonatomic,retain) IBOutlet UIButton *computerS;

@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;
@property(nonatomic, strong) AVAudioPlayer *sound;
@property (nonatomic, retain) IBOutlet UIButton *unmute;
@property (nonatomic, retain) IBOutlet UIButton *mute;


@end

