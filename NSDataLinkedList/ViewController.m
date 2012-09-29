//
//  ViewController.m
//  NSDataLinkedList
//
//  Created by Sam Davies on 26/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import "ViewController.h"

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
    [testArray release];
    [testList release];
     
}

- (void)dealloc {
    [_lblArrayResult release];
    [_lblDataResult release];
    [super dealloc];
}


- (IBAction)btnRunPressed:(id)sender {
    NSArray *times = [self runListProfile];
    self.lblDataResult.text = [NSString stringWithFormat:@"PushTime: %fs\nPopTime: %fs",
                               [[times objectAtIndex:0] doubleValue],
                               [[times objectAtIndex:1] doubleValue]];
}



#pragma mark - Profiling methods
- (NSArray*)runListProfile
{
    testList = [[LinkedList alloc] initWithCapacity:10000 incrementSize:10000];
    
    double startTime = CACurrentMediaTime();
    for (int i=0; i < 100000; i++) {
        [testList pushFront:arc4random() % 1000000];
    }
    double pushTime = CACurrentMediaTime();
    
    
    int poppedValue = 0;
    while (poppedValue != INVALID_NODE_CONTENT) {
        poppedValue = [testList popFront];
    }
    
    double popTime = CACurrentMediaTime();
    
    return [NSArray arrayWithObjects:[NSNumber numberWithDouble:(pushTime - startTime)], [NSNumber numberWithDouble:(popTime - pushTime)], nil];
}
@end
