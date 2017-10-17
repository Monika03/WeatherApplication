//
//  ViewController.m
//  weatherGrettings
//
//  Created by Ankam Mounika on 12/18/16.
//  Copyright © 2016 Mounika. All rights reserved.
//

#import "ViewController.h"
#import "NetworkHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityTextLabel;

@property (weak, nonatomic) IBOutlet UITextField *stateTextLabel;

@property (weak, nonatomic) IBOutlet UIButton *clickMeButton;

@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;

@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
- (IBAction)clickMeButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMeButton:(id)sender {
    
 
 [NetworkHelper getWeatherGreetingsFromstate:self.stateTextLabel.text
                                                city:self.cityTextLabel.text
                                                success:^(NSDictionary *resultDictionary){
                                                    NSMutableDictionary *currentDic = resultDictionary[@"current_observation"];
                                                    NSString *weatherCondition = currentDic[@"weather"];
//                                                    NSData *data = [NSData alloc]initWithContentsOfFile:resultDictionary[@""];
                                                    
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                    self.greetingLabel.text = [NSString stringWithFormat:@"Its %@ outside", weatherCondition];
                                                    });
                                        
                                       }
                                       failure:^(NSError *error)
                                    {
                                      NSLog(@"ERROR %@", error);
                                    }];


}
     


@end
