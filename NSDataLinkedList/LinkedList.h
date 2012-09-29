//
//  LinkedList.h
//  NSDataLinkedList
//
//  Created by Sam Davies on 26/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicSizedArray.h"

#define FINAL_NODE_OFFSET -1

typedef struct Node
{
    int nextNodeOffset;
    int value;
} Node;

@interface LinkedList : NSObject<DynamicSizedArray> {
    NSMutableData *nodeCache;
    int freeNodeOffset;
    int topNodeOffset;
    int _cacheSizeIncrements;
}

- (id)initWithCapacity:(int)capacity incrementSize:(int)increment;

@end
