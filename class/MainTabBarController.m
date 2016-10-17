//
//  MainTabBarController.m
//  MainTabBar
//
//  Created by mac on 14/12/11.
//  Copyright (c) 2014年 214644496@qq.com. All rights reserved.
//

#import "MainTabBarController.h"
#import "AppDelegate.h"
#define SelectedColor [UIColor whiteColor]
#define UnselectedColor UIColorFromRGB(0x888888)
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface MainTabBarController (){
    UILabel*label;
    UILabel*UnselectedLabel;
    NSArray *img;
    NSArray *img_selected;
}
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label=[[UILabel alloc ]initWithFrame:CGRectMake(0, -2, self.view.frame.size.width/self.tabBar.items.count, 2)];
    label.backgroundColor=[UIColor redColor];
    [self.tabBar addSubview:label];

    UnselectedLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, label.frame.size.width, self.view.frame.size.height)];
    UnselectedLabel.backgroundColor=UIColorFromRGB(0x000000);
    [self.tabBar addSubview:UnselectedLabel];
    
    self.tabBar.barTintColor = UIColorFromRGB(0x333333);//[UIColor whiteColor];
    self.tabBar.tintColor = UnselectedColor;
    
    img = @[@"sy",@"sy",@"sy",@"sy",@"sy"];
    img_selected =  @[@"sy_a",@"sy_a",@"sy_a",@"sy_a",@"sy_a"];
    
    for (int i =0; i<self.tabBar.items.count; i++) {
        UITabBarItem*it=self.tabBar.items[i];
        [it setFinishedSelectedImage:[UIImage imageNamed:img_selected[i]] withFinishedUnselectedImage:[UIImage imageNamed:img[i]]];
        [it setTitle:@"房子"];
        if (i==0) {
            [it setTitleTextAttributes:@{ UITextAttributeTextColor : SelectedColor } forState:UIControlStateNormal];
        }
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"Index:%lu",[tabBar.items indexOfObject:item]);
    
    [UIView animateWithDuration:0.3 animations:^{
        float x=self.view.frame.size.width/tabBar.items.count*[tabBar.items indexOfObject:item];
        label.frame=CGRectMake(x, -2, self.view.frame.size.width/tabBar.items.count, 2);
        UnselectedLabel.frame=CGRectMake(x, UnselectedLabel.frame.origin.y, UnselectedLabel.frame.size.width, UnselectedLabel.frame.size.height);
    }];
    for (UITabBarItem*tem in tabBar.items) {
        [tem setTitleTextAttributes:@{ UITextAttributeTextColor : UnselectedColor } forState:UIControlStateNormal];
    }
    [item setTitleTextAttributes:@{ UITextAttributeTextColor :  SelectedColor} forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
