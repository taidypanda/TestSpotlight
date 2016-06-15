//
//  ViewController.h
//  Test3DTouch
//
//  Created by 苹果 on 16/6/15.
//  Copyright © 2016年 苹果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray * array;
@property (nonatomic, strong) NSArray * images;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)pushToNextVCWithIdentifier:(NSString *)identifier;

@end

