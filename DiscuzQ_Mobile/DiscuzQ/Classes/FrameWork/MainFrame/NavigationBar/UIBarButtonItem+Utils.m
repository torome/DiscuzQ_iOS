//
//  UIBarButtonItem+DZBarButtonItem.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "UIBarButtonItem+Utils.h"
#import "DZNavItemButton.h"

@implementation UIBarButtonItem (Utils)


- (UIBarButtonItem *)initWithItemImageName:(NSString *)itemImageName target:(id)target action:(SEL)action {
    
    return [self initWithItemImageName:itemImageName HighImageName:nil ItemTitle:nil TitleColor:nil HighTitleColor:nil TitleFont:0 Bold:NO Layout:YES target:target action:action];
}

- (UIBarButtonItem *)initWithItemImageName:(NSString *)itemImageName Layout:(BOOL)isLeft target:(id)target action:(SEL)action {
    
    return [self initWithItemImageName:itemImageName HighImageName:nil ItemTitle:nil TitleColor:nil HighTitleColor:nil TitleFont:0 Bold:NO Layout:isLeft target:target action:action];
}

- (UIBarButtonItem *)initWithItemTitle:(NSString *)itemTitle Layout:(BOOL)isLeft target:(id)target action:(SEL)action {
    
    return [self initWithItemImageName:nil HighImageName:nil ItemTitle:itemTitle TitleColor:KTitle_Color HighTitleColor:KTitle_Color TitleFont:16 Bold:NO Layout:isLeft target:target action:action];
}

- (UIBarButtonItem *)initWithItemImageName:(NSString *)itemImageName HighImageName:(NSString *)highImageName ItemTitle:(NSString *)itemTitle TitleColor:(UIColor *)titleColor HighTitleColor:(UIColor *)highTitleColor TitleFont:(CGFloat)titleFont Bold:(BOOL)isBold Layout:(BOOL)isLeft target:(id)target action:(SEL)action {
    
    self = [self init];
    if (self) {
        //创建btn
        DZNavItemButton *btn = [[DZNavItemButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
        [btn setTitle:itemTitle forState:UIControlStateNormal];
        [btn.titleLabel setFont:isBold ? [UIFont boldSystemFontOfSize:titleFont] : [UIFont systemFontOfSize:titleFont]];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn setTitleColor:highTitleColor ? highTitleColor : titleColor forState:UIControlStateHighlighted];
        [btn.titleLabel setTextAlignment:isLeft ? NSTextAlignmentLeft : NSTextAlignmentRight];
        [btn setImage:[UIImage imageNamed:itemImageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highImageName.length ? highImageName : itemImageName] forState:UIControlStateHighlighted];
//        btn.contentHorizontalAlignment = isLeft ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
        if (itemTitle.length) {
            [btn sizeToFit];
        }else {
            btn.isLeft = isLeft;
        }
        if ([itemImageName isEqualToString:@"navi_reader_Back"]) {
            //返回按钮里面的x坐标间距需要调整
            btn.isBack = YES;
        }
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        self.customView = btn;
    }
    return self;
    
}


@end
