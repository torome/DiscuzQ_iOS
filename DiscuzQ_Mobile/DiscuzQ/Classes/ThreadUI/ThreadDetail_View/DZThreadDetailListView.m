//
//  DZThreadDetailListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailListView.h"
#import "DZThreadDetailSection.h"
#import "DZThreadDetailHeader.h"
#import "DZThreadPostCell.h"
#import "DZThreadDetailStyle.h"

@interface DZThreadDetailListView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) DZQDataThread *dataModel;  //!< 属性注释
//@property (nonatomic, strong) DZThreadDetailStyle *detailStyle;  //!< 属性注释
@property (nonatomic, strong) NSArray<DZQDataPost *> *dataList;  //!< 属性注释
@property (nonatomic, strong) DZThreadDetailHeader *headerView;  //!< 属性注释

@end

@implementation DZThreadDetailListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self config_ThreadDetailListView];
    }
    return self;
}

-(void)config_ThreadDetailListView{
    
    self.delegate = self;
    self.dataSource = self;
    self.tableHeaderView = self.headerView;
    [self registerClass:[DZThreadPostCell class] forCellReuseIdentifier:@"DZThreadPostCell"];
    [self registerClass:[DZThreadDetailSection class] forHeaderFooterViewReuseIdentifier:@"DZThreadDetailSection"];
}

-(DZThreadDetailStyle *)detailStyle{
    if (self.dataModel) {
        return (DZThreadDetailStyle *)self.dataModel.styleModel;
    }
    return nil;
}

-(void)updateThreadDetail:(DZQDataThread *)dataModel{
    
    DZQThreadRelationModel *relation = dataModel.relationships;
    self.dataList = relation.posts;
    self.dataModel = dataModel;
    
    [self.headerView updateDetailHead:dataModel layout:self.detailStyle.frame_detail_Head];
    
//    [self beginUpdates];
    self.headerView.frame = self.detailStyle.kf_Header;
    [self setTableHeaderView:self.headerView];
//    [self endUpdates];
    
    [self reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.detailStyle.kf_Section.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DZThreadDetailSection *Header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DZThreadDetailSection"];

    [Header updateSectionLike:self.dataModel.relationships.firstPost.relationships.likedUsers reward:self.dataModel.relationships.rewardedUsers layout:self.detailStyle.frame_detail_Section];

    return Header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZDPostCellStyle *CellStyle = (DZDPostCellStyle *)self.dataList[indexPath.row].styleModel;
    return CellStyle.kf_post_CellHeight;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZThreadPostCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"DZThreadPostCell" forIndexPath:indexPath];
    
    [postCell updateThreadPostCell:self.dataList[indexPath.row]];
    
    return postCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    DZQDataPost *dataPost = self.dataList[indexPath.row];
    
    KSLog(@"WBS 跳转 评论详情? 还是 ？");
    
}



-(DZThreadDetailHeader *)headerView{
    if (!_headerView) {
        _headerView = [[DZThreadDetailHeader alloc] initWithFrame:CGRectZero];
    }
    return _headerView;
}

@end