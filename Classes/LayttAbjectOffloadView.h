






#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^shldFourscoreBookBlock) (SKProduct * _Nullable product);

@interface LayttAbjectOffloadView : UIView
@property (nonatomic, strong) SKProduct *bvLanguageCash;
@property (nonatomic, strong) NSString *mngResolveTimeStr;
@property (nonatomic, strong) NSString *pnchReferenceMindStr;

@property (nonatomic, copy) shldFourscoreBookBlock block;
@property (nonatomic, strong) UIButton *iconImage;
@property (nonatomic, assign) NSInteger source;
@end

NS_ASSUME_NONNULL_END
