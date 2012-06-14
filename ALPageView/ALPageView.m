//  Copyright (c) 2012 Tomohiko Himura. All rights reserved.

#import "ALPageView.h"

@interface ALPageView ()
{
    UIScrollView* i_scrolView;
    UIPageControl* i_pageControl;
}

@end

@implementation ALPageView

@synthesize delegate = i_delegate;
@synthesize currentPage = i_currentPage;

#pragma mark - Private Methods
- (void)_init {
    i_scrolView = [[UIScrollView alloc] initWithFrame:self.bounds];
    i_scrolView.showsHorizontalScrollIndicator = NO;
    i_scrolView.pagingEnabled = YES;
    i_scrolView.delegate = self;
    i_scrolView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:i_scrolView];
    
    CGFloat height = 20;
    CGSize size = self.frame.size;
    CGRect rect = CGRectMake(0, size.height-height,size.width, height);
    i_pageControl = [[UIPageControl alloc] initWithFrame:rect];
    
    i_pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self addSubview:i_pageControl];
    
    i_currentPage = 0;
}

- (void)loadView:(UIView*)view withIndex:(NSInteger)i
{
    CGSize size = self.bounds.size;
    
    CGRect frame = self.bounds;
    frame.origin.x = size.width*i;
    view.frame = frame;
    [i_scrolView addSubview:view];
}

- (void)loadAroundView
{
    NSInteger count = i_pageControl.numberOfPages;
    int n = i_currentPage;
    for (int i = n-1; i<=n+1; i++) {
        if (i<0) continue;
        if (i>=count) continue;
        UIView* view = [self.delegate pageView:self viewAtIndex:i];
        [self loadView:view withIndex:i];
    }
}

- (NSInteger)getPageNumber
{
    CGPoint point = i_scrolView.contentOffset;
    CGRect bounds = i_scrolView.bounds;
    CGFloat offset = bounds.size.width/2;
    return (NSInteger) (point.x+offset) / bounds.size.width;
}

- (void)draw
{
    i_pageControl.currentPage = i_currentPage;
    [self loadAroundView];
}

#pragma mark - UIView Methods Override
#pragma mark initialize
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

/*
+ (Class)layerClass{
return [CALayer class];
}
*/

#pragma mark drawing
/*
- (void)drawRect:(CGRect)rect
{
// Drawing code
}
*/

#pragma mark layout
/*
- (CGSize)sizeThatFits:(CGSize)size
{
return size;
}
*/

/*
- (void)layoutSubviews
{
}
*/

/*
- (void)didAddSubView:(UIView*)view
{
}
 
- (void)willRemoveSubView:(UIView*)view
{
}
*/

/*
- (void)willMoveToSuperview:(UIView*)newSuperview
{
}
 
- (void)didMoveToSuperview
{
}
*/

- (void)willMoveToWindow:(UIWindow*)newWindow
{
    NSInteger numberOfPages = [self.delegate numberOfPagesWithPageView:self];
    i_pageControl.numberOfPages = numberOfPages;
    CGSize size = self.bounds.size;

    i_scrolView.contentOffset = CGPointMake(i_currentPage*size.width, 0);
    i_scrolView.contentSize = CGSizeMake(size.width*numberOfPages, size.height);
    [self draw];
}
 
- (void)didMoveToWindow
{
}

#pragma mark - Override UIResponder Methods
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}
*/

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    i_currentPage = [self getPageNumber];
    [self draw];
}

@end
