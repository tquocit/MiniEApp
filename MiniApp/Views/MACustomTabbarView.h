//
//  MACustomTabbarView.h
//  MiniApp
//
//  Created by Quoc on 1/25/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabBarDelegate <NSObject>

- (void)tabWasSelected:(NSInteger)index;
@end

@interface MACustomTabbarView : UIView

@property (nonatomic, assign) NSObject<TabBarDelegate> *delegate;

@property (nonatomic, strong) IBOutlet UIButton *infoButton;
@property (nonatomic, strong) IBOutlet UIButton *contactButton;

- (IBAction)infoTouch:(id)sender;
- (IBAction)contactTouch:(id)sender;

@end
