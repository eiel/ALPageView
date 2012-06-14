//  Copyright (c) 2012 Tomohiko Himura. All rights reserved.

#import "ALViewController.h"

@interface ALViewController ()
{
    NSArray* i_views;
}
@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake(80, 120, 160, 240);
    ALPageView* pageView = [[ALPageView alloc] initWithFrame:frame];
    pageView.backgroundColor = [UIColor grayColor];
    pageView.delegate = self;
    [self.view addSubview:pageView];
    
    NSArray* colors = [NSArray arrayWithObjects:
                       [UIColor redColor],
                       [UIColor blueColor],
                       [UIColor greenColor],
                       [UIColor yellowColor],
                       nil];
    NSMutableArray* views = [NSMutableArray arrayWithCapacity:[colors count]];
    for (UIColor* color in colors) {
        UIView* view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = color;
        [views addObject:view];
    }
    i_views = views;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfPagesWithPageView:(ALPageView *)pageView
{
    return [i_views count];
}

- (UIView*)pageView:(ALPageView*)pageView viewAtIndex:(NSInteger)index
{
    return [i_views objectAtIndex:index];
}

@end
