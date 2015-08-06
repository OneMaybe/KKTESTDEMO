






#import <UIKit/UIKit.h>

@interface UITableView (FDTemplateLayoutCell)


- (CGFloat)fd_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(id cell))configuration;


- (CGFloat)fd_heightForCellWithIdentifier:(NSString *)identifier cacheByIndexPath:(NSIndexPath *)indexPath configuration:(void (^)(id cell))configuration;


@property (nonatomic, assign) BOOL fd_debugLogEnabled;

@end

@interface UITableViewCell (FDTemplateLayoutCell)

@property (nonatomic, assign) BOOL fd_isTemplateLayoutCell;

@property (nonatomic, assign) BOOL fd_enforceFrameLayout;

@end
