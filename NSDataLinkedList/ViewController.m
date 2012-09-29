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
    if (testList) {
        [testList release];
    }
    testList = [[LinkedList alloc] initWithCapacity:10000 incrementSize:10000];
    [self runTestWithList:testList resultLabel:self.lblDataResult];
    
    if (testArray) {
        [testArray release];
    }
    testArray = [[NSArrayDSA alloc] initWithCapacity:10000];
    [self runTestWithList:testArray resultLabel:self.lblArrayResult];
}



#pragma mark - Profiling methods
- (void)runTestWithList:(id<DynamicSizedArray>)list resultLabel:(UILabel *)lbl
{
    NSArray *times = [self runListProfileWithList:list maxSize:10000000];
    lbl.text = [NSString stringWithFormat:@"PushTime: %fs\nPopTime: %fs",
                               [[times objectAtIndex:0] doubleValue],
                               [[times objectAtIndex:1] doubleValue]];
}


- (NSArray*)runListProfileWithList:(id<DynamicSizedArray>)list maxSize:(int)maxSize
{    
    double startTime = CACurrentMediaTime();
    for (int i=0; i < maxSize; i++) {
        [list pushFront:arc4random() % 1000000];
    }
    double pushTime = CACurrentMediaTime();
    
    int poppedValue = 0;
    while (poppedValue != INVALID_NODE_CONTENT) {
        poppedValue = [list popFront];
    }
    
    double popTime = CACurrentMediaTime();
    
    return [NSArray arrayWithObjects:[NSNumber numberWithDouble:(pushTime - startTime)],
                                     [NSNumber numberWithDouble:(popTime - pushTime)],
                                     nil];
}
@end
