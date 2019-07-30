//
//  ZDTableSection.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDTableSection.h"
#import "ZDTableViewProxy.h"

NSString *const ZDRerenderTableSectionHeaderNotify = @"com.xuetian.xtfoundation.notify.RerenderTableSectionHeader";
NSString *const ZDRerenderTableSectionFooterNotify = @"com.xuetian.xtfoundation.notify.RerenderTableSectionFooter";

@implementation ZDTableSection
+ (instancetype)section {
    return [[self alloc] initWithID:nil];
}

+ (instancetype)sectionWithID:(id<NSCopying>)identity {
    return [[self alloc] initWithID:identity];
}

- (void)setHeaderClass:(Class)headerClass {
    [self setHeaderClass:headerClass withReuseID:nil];
}

- (void)setHeaderClass:(Class)headerClass withReuseID:(NSString *)identifier {
    _headerClass = headerClass;
    _headerReuseID = identifier ?: NSStringFromClass(headerClass);
}

- (void)setFooterClass:(Class)footerClass {
    [self setFooterClass:footerClass withReuseID:nil];
}

- (void)setFooterClass:(Class)footerClass withReuseID:(NSString *)identifier {
    _footerClass = footerClass;
    _footerReuseID = identifier ?: NSStringFromClass(footerClass);
}

- (void)rerenderHeader {
    [[NSNotificationCenter defaultCenter] postNotificationName:ZDRerenderTableSectionHeaderNotify object:self];
}

- (void)rerenderFooter {
    [[NSNotificationCenter defaultCenter] postNotificationName:ZDRerenderTableSectionFooterNotify object:self];
}
#pragma mark ==================  ZDTableViewSectionDelegate   ==================
- (CGFloat)ZDTableViewHeaderHeightWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.headerHeight) {
        return self.headerHeight(self, proxy, section);
    }
    return UITableViewAutomaticDimension;
}
- (CGFloat)ZDTableViewFooterHeightWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.footerHeight) {
        return self.footerHeight(self, proxy, section);
    }
    return UITableViewAutomaticDimension;
}
- (void)ZDTableViewHeader:(__kindof UITableViewHeaderFooterView *)header preparedWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.headerPrepared) {
        self.headerPrepared(self, header, proxy, section);
    }
}
- (void)ZDTableViewFooter:(__kindof UITableViewHeaderFooterView *)footer preparedWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.footerPrepared) {
        self.footerPrepared(self, footer, proxy, section);
    }
}
@end

@implementation NSArray (ZDTableSection)
- (ZDTableSection *)tableSection {
    return [[ZDTableSection alloc] initWithArray:self];
}

@end
