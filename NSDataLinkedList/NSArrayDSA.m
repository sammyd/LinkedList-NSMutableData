//
//  NSArrayDSA.m
//  NSDataLinkedList
//
//  Created by Sam Davies on 29/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import "NSArrayDSA.h"

@implementation NSArrayDSA

- (id)initWithCapacity:(int)capacity
{
    self = [super init];
    if(self) {
        array = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

- (void)dealloc
{
    [array release];
    [super dealloc];
}

#pragma DynamicSizedArray protocol methods
- (void)pushFront:(int)p
{
    [array insertObject:[NSNumber numberWithInt:p] atIndex:0];
}

- (void)pushBack:(int)p
{
    [array addObject:[NSNumber numberWithInt:p]];
}

- (int)popFront
{
    int v;
    if(array.count > 0) {
        v = [[array objectAtIndex:0] intValue];
        [array removeObjectAtIndex:0];
    } else {
        v = INVALID_NODE_CONTENT;
    }
    return v;
}

- (int)popBack
{
    int v;
    if (array.count > 0) {
        v = [[array lastObject] intValue];
        [array removeLastObject];
    } else {
        v = INVALID_NODE_CONTENT;
    }
    return v;
}

@end
