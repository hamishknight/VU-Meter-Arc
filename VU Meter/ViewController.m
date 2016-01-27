//
//  ViewController.m
//  VU Meter
//
//  Created by Hamish Knight on 27/01/2016.
//  Copyright © 2016 Redonkulous Apps. All rights reserved.
//

#import "ViewController.h"
#import "view.h"

@implementation ViewController

-(void) loadView {
    self.view = [[view alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

@end
