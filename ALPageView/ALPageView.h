//  Copyright (c) 2012 Tomohiko Himura. All rights reserved.

#import <UIKit/UIKit.h>

@protocol ALPageViewDelegate;

@interface ALPageView : UIView <UIScrollViewDelegate>

@property (assign, nonatomic) id<ALPageViewDelegate> delegate;
@property (assign, nonatomic) NSInteger currentPage;

@end

@protocol ALPageViewDelegate <NSObject>

- (NSInteger)numberOfPagesWithPageView:(ALPageView *)pageView;
- (UIView*)pageView:(ALPageView*)pageView viewAtIndex:(NSInteger)index;

@end