//
//  ViewController.m
//  CoreDataModel
//
//  Created by 100qu on 17/1/6.
//  Copyright © 2017年 100qu. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UILabel *logLabel;

@property (nonatomic,weak) IBOutlet UITextField *textField;

@property (nonatomic,strong) NSDateFormatter *formatter;

@property (nonatomic,assign) NSTimeInterval  touchDownTime;
@property (nonatomic,assign) NSTimeInterval  touchUpTime;

@end

@implementation ViewController
- (NSDateFormatter *)formatter{
    if(!_formatter){
        _formatter = [[NSDateFormatter alloc]init];
    }
    return _formatter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSManagedObjectModel
//    NSManagedObjectContext
//    NSPersistentStoreCoordinator

}

NSTimeInterval count = 0;

- (IBAction)ButtonTapDown:(id)sender{
    
    _touchDownTime = [NSDate timeIntervalSinceReferenceDate]*1000;
    NSLog(@"date:%.f",_touchDownTime);
    count = 0;
    self.logLabel.text = @"";
   NSTimer *timer = [NSTimer timerWithTimeInterval:0.001 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}
- (void)update:(NSTimer *)timer{
    count++;    
    if (count >= self.textField.text.floatValue) {
        self.logLabel.text = @"stop";
        [timer invalidate];
    }
}
- (IBAction)ButtonTapUp:(id)sender{
    [self.formatter setDateFormat:@"SSS"];
    _touchUpTime = [NSDate timeIntervalSinceReferenceDate]*1000;
    NSLog(@"date:%.f",_touchUpTime);
    NSLog(@"_touchUpTime-_touchDownTime:%.f",_touchUpTime-_touchDownTime);
    self.logLabel.text = [NSString stringWithFormat:@"%.f",_touchUpTime-_touchDownTime];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
