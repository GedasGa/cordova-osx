/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate


@synthesize viewController;
@synthesize window;

- (id)init{
    self = [super init];
    return self;
}

- (void)createViewController: (NSString*) startPage {
    NSAssert(!self.viewController, @"ViewController already created.");
    if (startPage == nil) {
        startPage = @"index.html";
    }
    self.viewController = [[MainViewController alloc] initWithWindowNibName:@"MainViewController"];
    self.viewController.wwwFolderName = @"www";
    self.viewController.startPage = startPage;
    [[self.viewController window] makeKeyAndOrderFront:self];
}

- (void)destroyViewController
{
    [self.viewController close];
    self.viewController = nil;
}

- (void) applicationDidStartLaunching:(NSNotification*) aNotification {
}

- (void) applicationWillFinishLaunching:(NSNotification*)aNotification{
}

- (void) applicationDidFinishLaunching:(NSNotification*)aNotification {
    // Create the main view on start-up only when not running unit tests.
    Class testProbeClass = NSClassFromString(@"XCTestProbe");
    if (!testProbeClass) {
        testProbeClass = NSClassFromString(@"SenTestProbe");
    }
    if (!testProbeClass) {
        [self createViewController: nil];
    }
}

@end
