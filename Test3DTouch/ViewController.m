//
//  ViewController.m
//  Test3DTouch
//
//  Created by 苹果 on 16/6/15.
//  Copyright © 2016年 苹果. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        self.array = @[@"jd", @"toabao", @"tmall"];
        self.images = @[@"jd", @"taobao", @"tmall"];
        
        NSMutableArray * searchableItems = [NSMutableArray array];
        for (int i = 0; i < self.array.count; i++) {
            CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType: (NSString *) kCIAttributeTypeImage];
            attributeSet.title = self.array[i];
            attributeSet.contentDescription = [NSString stringWithFormat:@"the online store named %@\nPlease contect me to discuss the ad-rate\nThanks!", self.array[i]];
            attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:self.images[i]]);
            
            NSString * identifier = [NSString stringWithFormat:@"%@",self.images[i]];
            CSSearchableItem * searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:identifier domainIdentifier:@"Huiyang.Test3DTouch" attributeSet:attributeSet];
            NSLog(@"%d serachable item's uniqueidentifier is %@", i, searchableItem.uniqueIdentifier);
            [searchableItems addObject:searchableItem];
        }
        
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
            if (!error) {
                NSLog(@"yes");
            }
        }];
        
    });
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushToNextVCWithIdentifier:(NSString *)identifier
{
    NSString * iden = @"jd", *iden2 = @"tmall", *iden3 = @"taobao";
    if ([identifier isEqualToString:iden]) {
        [self performSegueWithIdentifier:iden sender:self];
    }else if ([identifier isEqualToString:iden2]){
        [self performSegueWithIdentifier:iden2 sender:self];
    }else if ([identifier isEqualToString:iden3]){
        [self performSegueWithIdentifier:iden3 sender:self];
    }else{
        NSLog(@"no have data");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
