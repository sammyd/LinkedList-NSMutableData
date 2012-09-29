//
//  LinkedListTests.m
//  NSDataLinkedList
//
//  Created by Sam Davies on 28/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import "LinkedListTests.h"

@implementation LinkedListTests

- (void)setUp
{
    [super setUp];
    list = [[LinkedList alloc] initWithCapacity:4 incrementSize:2];
}

- (void)tearDown
{
    [list release];
    [super tearDown];
}

- (void)testInitialisationCreatesCorrectMemoryBlockSize
{
    int sizeOfCache = [list getNodeCache].length / sizeof(Node);
    STAssertEquals(sizeOfCache, 4, @"Initialisation creates cache of correct size");
}

- (void)testPushFrontAddsNewNode
{
    [list pushFront:12];
    Node *node = (Node*)[list getNodeCache].bytes;
    STAssertEquals(node->value, 12, @"Push front adds new node");
}

- (void)testPushBackAddsNewNode
{
    [list pushBack:15];
    Node *node = (Node*)[list getNodeCache].bytes;
    STAssertEquals(node->value, 15, @"Push back adds new node");
}

- (void)testPopFrontRemovesNode
{
    [list pushFront:1];
    [list pushFront:2];
    int v = [list popFront];
    STAssertEquals(v, 2, @"Pop front removes front node");
}

- (void)testPopBackRemovesNode
{
    [list pushFront:3];
    [list pushFront:5];
    int v = [list popBack];
    STAssertEquals(3, v, @"Pop back removes last node");
}

- (void)testQueueAutomaticallyIncreasesInSize
{
    for (int i = 0; i < 5; i++) {
        [list pushFront:i];
    }
    int sizeOfCache = [list getNodeCache].length / sizeof(Node);
    STAssertEquals(sizeOfCache, 6, @"The cache should have been increased the the specified increment size");
}


- (void)testCacheDoesNotDecreaseInSize
{
    for (int i=0; i < 5; i++) {
        [list pushFront:i];
    }
    for (int i=0; i < 3; i++) {
        [list popBack];
    }
    int sizeOfCache = [list getNodeCache].length / sizeof(Node);
    STAssertEquals(sizeOfCache, 6, @"The cache shouldn't shrink in size");
}

- (void)testMoreComplexOperation
{
    // Reset the list
    [list release];
    list = [[LinkedList alloc] initWithCapacity:1000 incrementSize:500];
    
    NSMutableArray *testArray = [[[NSMutableArray alloc] init] autorelease];
    // Let's fill it
    for (int i = 0; i < 10000; i++) {
        int v = arc4random() % 1000000;
        if (i % 2 == 0) {
            [testArray insertObject:[NSNumber numberWithInt:v] atIndex:0];
            [list pushFront:v];
        } else {
            [testArray addObject:[NSNumber numberWithInt:v]];
            [list pushBack:v];
        }
    }
    
    // And now lets do some removals
    for (int i = 0; i < 10000; i++) {
        int listValue;
        NSNumber *arrayValue;
        if (i % 2 == 0) {
            listValue = [list popBack];
            arrayValue = [testArray lastObject];
            [testArray removeLastObject];
            STAssertEquals([arrayValue intValue], listValue, @"Linked list should work same as NSArray");
        } else {
            listValue = [list popFront];
            arrayValue = [testArray objectAtIndex:0];
            [testArray removeObjectAtIndex:0];
            STAssertEquals([arrayValue intValue], listValue, @"Linked list should work same as NSArray");
        }
    }

}

@end
