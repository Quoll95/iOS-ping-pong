//
//  ViewController.m
//  Gioco_prova
//
//  Created by Marco Marazzi on 02/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import "ViewController.h"
#import "Menu.h"
#import "Info.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>


@interface ViewController ()

@end

#define kPartitaInCorso 1
#define kPartitaFerma 2

#define kVelocitaPallaX 5
#define kVelocitaPallaY 10
#define sizey [[UIScreen mainScreen] bounds].size.height
#define sizex [[UIScreen mainScreen] bounds].size.width
#define dimpalla 20


@implementation ViewController


- (void)viewDidLoad {
    [self Musica];
    _musica=[NSTimer scheduledTimerWithTimeInterval:400.00 target:self selector:@selector(Musica) userInfo:nil repeats:YES];
    sizebarra=barraDue.frame.size.width;
    sizebarra_2=barraUno.frame.size.width;
    dx=7;
    puntiU=0;
    puntiD=0;
    [super viewDidLoad];
    self.statoPartita=kPartitaFerma;
    velocitaPalla=CGPointMake(kVelocitaPallaX, kVelocitaPallaY);
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
   
}


-(void)gameLoop{
    backgroundMusic.volume=1;
    puntiUno.text = [NSString stringWithFormat:@"%ld", (long)puntiU];
    puntiDue.text = [NSString stringWithFormat:@"%ld", (long)puntiD];
    if (statoPartita == kPartitaInCorso){
        menu.hidden=YES;
        buttonS.hidden=NO;
        buttonD.hidden=NO;
        computerS.hidden=NO;
        computerD.hidden=NO;
        pallina.center = CGPointMake(pallina.center.x + velocitaPalla.x, pallina.center.y + velocitaPalla.y);
        if (pallina.center.x <0+dimpalla || pallina.center.x>sizex-dimpalla){velocitaPalla.x = -velocitaPalla.x;}
        if (pallina.center.y <0+dimpalla || pallina.center.y >sizey-dimpalla){velocitaPalla.y = -velocitaPalla.y;}
        if(statoPartita==kPartitaFerma){
            textIniziale.hidden = NO;
            pause.hidden=YES;
        }
        else if(statoPartita==kPartitaInCorso){
            textIniziale.hidden=YES;
            pause.hidden=NO;
        }
        if (indietro.hidden==NO) indietro.hidden=YES;
        if (CGRectIntersectsRect(pallina.frame, barraDue.frame)){
            [self playSound];
            velocitaPalla.y = -velocitaPalla.y;
        }
        else if(CGRectIntersectsRect(pallina.frame, barraUno.frame)){
            [self playSound];
            velocitaPalla.y = -velocitaPalla.y;
        }
        if (pallina.frame.origin.y>barraDue.frame.origin.y){
            puntiU+=1;
            buttonS.hidden=YES;
            buttonD.hidden=YES;
            computerS.hidden=YES;
            computerD.hidden=YES;
            [prova invalidate];
            [prova2 invalidate];
            [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
            statoPartita=kPartitaFerma;
            textIniziale.hidden = NO;
            indietro.hidden=NO;
            
            
        }
        else if (pallina.frame.origin.y<barraUno.frame.origin.y){
            puntiD+=1;
            buttonS.hidden=YES;
            buttonD.hidden=YES;
            computerS.hidden=YES;
            computerD.hidden=YES;
            [prova invalidate];
            [prova2 invalidate];
            [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
            statoPartita=kPartitaFerma;
            textIniziale.hidden = NO;
            indietro.hidden=NO;
            
        }

    }
    else if(statoPartita==kPartitaFerma){
        menu.hidden=NO;
        pause.hidden=YES;
        indietro.hidden=NO;
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
    }
    
}



- (IBAction)Inizia:(id)sender {
    menu.hidden=YES;
    premutoC_D=NO;
    premutoC_S=NO;
    premutoD=NO;
    premutoS=NO;
    buttonD.hidden=NO;
    buttonS.hidden=NO;
    computerS.hidden=NO;
    computerD.hidden=NO;
    if(statoPartita == kPartitaFerma){
        pause.hidden=NO;
        menu.hidden=NO;
        textIniziale.hidden = YES;
        statoPartita = kPartitaInCorso;
        if (buttonD.hidden==YES || buttonS.hidden==YES){
            premutoC_D=NO;
            premutoC_S=NO;
            premutoD=NO;
            premutoS=NO;
            buttonS.hidden=NO;
            buttonD.hidden=NO;
            computerS.hidden=NO;
            computerD.hidden=NO;
        }
        
    }
}

- (IBAction)Pause:(id)sender {
    if(statoPartita == kPartitaInCorso){
        textIniziale.hidden = NO;
        statoPartita = kPartitaFerma;
        [prova invalidate];
        [prova2 invalidate];
        premutoD=0;
        premutoS=0;
        premutoC_D=0;
        premutoC_S=0;
        buttonD.hidden=YES;
        buttonS.hidden=YES;
        computerS.hidden=YES;
        computerD.hidden=YES;
        indietro.hidden=NO;
        menu.hidden=NO;
        
    }

    
}

-(void)Destra_2{
    if (barraDue.frame.origin.x>sizex-sizebarra+8){
        [prova invalidate];
        return;
    }
    barraDue.frame = CGRectOffset(barraDue.frame, dx, 0);
}



- (IBAction)Destra:(id)sender {
    if (premutoD==1) return;
    else{
        [prova invalidate];
        premutoD=1;
        premutoS=0;
        prova= [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(Destra_2) userInfo:nil repeats:YES];
    }

}


-(void)Sinistra_2{
    if (barraDue.frame.origin.x<0){
        [prova invalidate];
        return;
    }
    barraDue.frame = CGRectOffset(barraDue.frame, -dx, 0);
}

- (IBAction)Sinistra:(id)sender {
    if (premutoS==1) return;
    else{
        [prova invalidate];
        premutoS=1;
        premutoD=0;
        prova= [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(Sinistra_2) userInfo:nil repeats:YES];
    }
}


- (IBAction)Indietro:(id)sender {
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Posiziona) userInfo:nil repeats:NO];
    puntiD=0;
    puntiU=0;
    statoPartita=kPartitaFerma;
    
}


- (IBAction)Menu:(id)sender {
    Menu* _menu_ = [[Menu alloc] initWithNibName:@"Menu"  bundle:nil];
    [self presentViewController:_menu_ animated:YES completion:NULL];
    
}


- (IBAction)ComputerD:(id)sender {
    if (premutoC_D==1) return;
    else{
        [prova2 invalidate];
        premutoC_D=1;
        premutoC_S=0;
        prova2= [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(DestraC_2) userInfo:nil repeats:YES];
}

}

-(void)DestraC_2{
    if (barraUno.frame.origin.x>sizex-sizebarra_2){
        [prova2 invalidate];
        return;
    }
    barraUno.frame = CGRectOffset(barraUno.frame, dx, 0);

}


- (IBAction)ComputerS:(id)sender {
    if (premutoC_S==1) return;
    else{
        [prova2 invalidate];
        premutoC_S=1;
        premutoC_D=0;
        prova2= [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(SinistraC_2) userInfo:nil repeats:YES];
    }
}

-(void)SinistraC_2{
    if (barraUno.frame.origin.x<0){
        [prova2 invalidate];
        return;
    }
    barraUno.frame = CGRectOffset(barraUno.frame, -dx, 0);
}





-(void)Musica{
    NSURL *musicFile = [[NSBundle mainBundle] URLForResource:@"Fury of the Storm"
                                               withExtension:@"mp3"];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile
                                                                  error:nil];
    self.backgroundMusic.numberOfLoops = -1;
    [self.backgroundMusic play];
    unmute.hidden=NO;
    mute.hidden=YES;

    

}

- (IBAction)Mute:(id)sender {
    [_musica invalidate];
    [backgroundMusic pause];
    unmute.hidden=YES;
    mute.hidden=NO;
}

- (IBAction)Unmute:(id)sender {
    [self _musica];
    [backgroundMusic play];
    unmute.hidden=NO;
    mute.hidden=YES;
}



-(void)Sound{
    NSURL *soundFile = [[NSBundle mainBundle] URLForResource:@"Hockey"
                                               withExtension:@"mp3"];
    self.sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile
                                                                  error:nil];
    self.sound.numberOfLoops = 1;
    [self.sound play];
}

-(void) playSound {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Hockey" ofType:@"mp3"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}











-(void) Posiziona{
    barraUno.frame = CGRectMake((sizex-sizebarra)/2, 34, sizex/4.31, 15);
    barraDue.frame = CGRectMake((sizex-sizebarra)/2, sizey-45, sizex/4.31, 15);
    pallina.frame = CGRectMake((sizex-20)/2,(sizey-20)/2, 20, 20);
    puntiUno.frame=CGRectMake(20,(sizey/2)-puntiUno.frame.size.height-10,51,51);
    puntiDue.frame=CGRectMake(20,(sizey/2)+10,51,51);
    pause.frame = CGRectMake(15,(sizey)/1.08,20,20);
    indietro.frame = CGRectMake(sizex-35,(sizey)/1.08,20,20);
    textIniziale.frame=CGRectMake((sizex-200)/2,(sizey-400)/2,200,400);
    buttonS.frame=CGRectMake(0, sizey/2, sizex/2, sizey/2);
    buttonD.frame=CGRectMake(sizex/2, sizey/2, sizex/2, sizey/2);
    computerS.frame=CGRectMake(0, 30, sizex/2, sizey/2);
    computerD.frame=CGRectMake(sizex/2, 30, sizex/2, sizey/2);
    mute.frame=CGRectMake(sizex-35, barraUno.frame.size.height+barraUno.frame.origin.y-mute.frame.size.height, 20, 20);
    unmute.frame=CGRectMake(sizex-35, barraUno.frame.size.height+barraUno.frame.origin.y-mute.frame.size.height, 20, 20);
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@synthesize barraUno, barraDue, pallina, textIniziale, puntiUno, puntiDue, statoPartita, velocitaPalla,pause,premutoD,premutoS, prova, buttonD,buttonS,indietro,dx,sizebarra,menu,computerD,computerS,premutoC_D,premutoC_S,sizebarra_2,prova2,backgroundMusic,unmute,mute,_musica,sound;

@end
