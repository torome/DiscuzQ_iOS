//
//  DZQPostRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQThreadModel.h"
#import "DZQAttachmentModel.h"


@interface DZQPostRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!<  回复的作者
@property (nonatomic, strong) DZQDataThread *thread;  //!<  回复所对应的主题
@property (nonatomic, strong) DZQDataUser *replyUser;  //!< 回复所回复的用户
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *images;  //!< 回复的图片

@property (nonatomic, strong) NSArray<DZQDataUser *> *likedUsers;  //!< 点赞回复的用户（主题详情接口）
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *attachments;  //!< 首贴附件(主题详情接口)


@end


