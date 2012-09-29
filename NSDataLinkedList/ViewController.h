//
//  ViewController.h
//  NSDataLinkedList
//
//  Created by Sam Davies on 26/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkedList.h"

@interface ViewController : UIViewController {
    NSMutableArray *testArray;
    LinkedList *testList;
}

@property (retain, nonatomic) IBOutlet UILabel *lblArrayResult;
@property (retain, nonatomic) IBOutlet UILabel *lblDataResult;

- (IBAction)btnRunPressed:(id)sender;

@end
