//
//  Info.h
//  Gioco_prova
//
//  Created by Marco Marazzi on 06/12/15.
//  Copyright © 2015 Marco Marazzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Info : UIViewController{
    
    IBOutlet UILabel *info;
    
    IBOutlet UIButton *indietro;
    
    IBOutlet UITextView *text;
}

@property(nonatomic,retain) IBOutlet UILabel *info;

@property(nonatomic,retain) IBOutlet UIButton *indietro;
@property(nonatomic,retain) IBOutlet UITextView *text;

@end
