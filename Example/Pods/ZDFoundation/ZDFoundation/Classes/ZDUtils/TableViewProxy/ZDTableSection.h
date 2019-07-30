//
//  ZDTableSection.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//
#import "ZDMutableArray.h"
@class ZDTableViewProxy;
@class ZDTableSection;

UIKIT_EXTERN NSString *const ZDRerenderTableSectionHeaderNotify;
UIKIT_EXTERN NSString *const ZDRerenderTableSectionFooterNotify;

/// section的高
typedef CGFloat (^ZDTableSectionHeightBlock)(__kindof ZDTableSection *sectionData, ZDTableViewProxy *proxy, NSUInteger section);
/// section header/footer 展示
typedef void (^ZDTableSectionPreparedBlock)(__kindof ZDTableSection *sectionData, __kindof UITableViewHeaderFooterView *view, ZDTableViewProxy *proxy, NSUInteger section);

/// section协议
@protocol ZDTableViewSectionDelegate <NSObject>
/// 分区header 的高
- (CGFloat)ZDTableViewHeaderHeightWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区footer的高
- (CGFloat)ZDTableViewFooterHeightWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区header 初始化
- (void)ZDTableViewHeader:(__kindof UITableViewHeaderFooterView *)header preparedWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区footer 初始化
- (void)ZDTableViewFooter:(__kindof UITableViewHeaderFooterView *)footer preparedWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section;
@end


@interface ZDTableSection<__covariant ObjectType> : ZDMutableArray<ZDTableViewSectionDelegate>
/// 额外信息，默认为nil
@property (nonatomic, strong) NSDictionary *infoDictionary;
/// SectionHeaderView的类，如果为nil，则显示系统默认header
@property (nonatomic, readonly) Class headerClass;
/// SectionHeaderView的重用标识符
@property (nonatomic, readonly) NSString *headerReuseID;
/// 获取SectionHeader的高度，默认为UITableView
@property (nonatomic, assign) ZDTableSectionHeightBlock headerHeight;
/// SectionHeader初始化
@property (nonatomic, copy) ZDTableSectionPreparedBlock headerPrepared;

/// SectionFooterView的类，如果为nil，则显示系统默认footer
@property (nonatomic, readonly) Class footerClass;
/// SectionHeaderView的重用标识符
@property (nonatomic, readonly) NSString *footerReuseID;
/// 获取SectionFooter的高度
@property (nonatomic, assign) ZDTableSectionHeightBlock footerHeight;
/// SectionFooter初始化
@property (nonatomic, copy) ZDTableSectionPreparedBlock footerPrepared;

+ (instancetype)section;
+ (instancetype)sectionWithID:(id<NSCopying>)sid;

/**
 重新渲染SectionHeader视图
 如果当前数据源代表的SectionHeader没有被重用，会在强制触发当前数据源内部的“CKTableViewHeader:preparedWithTableView:”方法
 */
- (void)rerenderHeader;

/**
 重新渲染SectionFooter视图
 如果当前数据源代表的SectionFooter没有被重用，会在强制触发当前数据源内部的“CKTableViewFooter:preparedWithTableView:”方法
 */
- (void)rerenderFooter;

/**
 注册SectionHeaderView的类，使用类名作为重用标识符
 */
- (void)setHeaderClass:(Class)headerClass;

/**
 注册SectionHeaderView的类，如果identifier为nil，使用类名作为重用标识符
 */
- (void)setHeaderClass:(Class)headerClass withReuseID:(NSString *)identifier;

/**
 注册SectionFooterView的类，使用类名作为重用标识符
 */
- (void)setFooterClass:(Class)footerClass;

/**
 注册SectionFooterView的类，如果identifier为nil，使用类名作为重用标识符
 */
- (void)setFooterClass:(Class)footerClass withReuseID:(NSString *)identifier;
@end

@interface NSArray (ZDTableSection)
- (ZDTableSection *)tableSection;
@end

