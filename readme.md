# NSMutableData backed array

This project is a demonstration of how to implement a dynamically-sized
array using `NSMutableData` for primitive data types. This is based on
a linked list and the application is used to compare the speed to that
of using 


## Motivation

I was recently working on a a selection of image processing algorithms,
which required data structures (such as a priority queue) which could
hold of the order of tens of millions of integers (pixel values). I found
that using `NSMutableArray` and `NSNumber` was far too slow and memory
intensive. I therefore built a custom class which uses lower-level
techniques, based on `NSMutableData` to use the objective-C memory management
functionality.

This is a demo app for this general technique.

## How to use

The app is built on iOS 6 - just cos that's what comes out of the box.

To run the test suite, just use XCode's test task. These test the functionality
of the `LinkedList` class.

To run the comparison routine, spin up the app and press the button. Magic.

## Further Info

This project is the basis of a blog post available at
http://sammyd.github.com/blog/2012/09/29/a-faster-array-in-objective-c/

Please note that this is a demo project - it's not production ready.

sx