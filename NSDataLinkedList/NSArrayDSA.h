//
//  NSArrayDSA.h
//  NSDataLinkedList
//
//  Created by Sam Davies on 29/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicSizedArray.h"

@interface NSArrayDSA : NSObject <DynamicSizedArray> {
    NSMutableArray *array;
}

@end
