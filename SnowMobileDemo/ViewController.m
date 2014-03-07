//
//  ViewController.m
//  SnowMobileDemo
//
//  Created by Janie Clayton-Hasz on 2/22/14.
//  Copyright (c) 2014 Third Impact Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    SystemSoundID _soundID;
    NSString *_fileName;
}


@property (weak, nonatomic) IBOutlet UIButton *pressMe;
@property (weak, nonatomic) IBOutlet UILabel *tadaLabel;
@property (nonatomic, getter = isPlaying) BOOL playing;
- (IBAction)pressMeButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)playSound
{
    _fileName = [[NSBundle mainBundle] pathForResource:@"Bubbles"
                                                ofType:@"caf"];
    assert(nil != _fileName);
    
    NSURL *url = [NSURL fileURLWithPath:_fileName];
    assert(nil != url);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &_soundID);
    AudioServicesPlaySystemSound(_soundID);
}

- (IBAction)pressMeButton:(id)sender {
    // Change the label text
    self.tadaLabel.text = @"Ta Da!! :D";
    
    [self playSound];
}

- (void) dealloc
{
    AudioServicesDisposeSystemSoundID(_soundID);
}
@end
