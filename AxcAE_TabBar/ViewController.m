//
//  ViewController.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "ViewController.h"
#import "AxcAE_TabBarDefine.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic_ = self.dataArray[indexPath.section];
    NSArray *arr = [dic_ objectForKey:@"arr"];
    NSDictionary *dic = arr[indexPath.row];
    NSString *VCName = [dic objectForKey:@"VCName"];
    Class class = NSClassFromString(VCName);
    UITabBarController *viewController = [[class alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = self.dataArray[section];
    NSArray *arr = [dic objectForKey:@"arr"];
    return arr.count;
}
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataArray[indexPath.section];
    NSArray *arr = [dic objectForKey:@"arr"];
    NSDictionary *rowDic = arr[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"axc"];
    
    NSMutableAttributedString *titleStr = [self markString:[NSString stringWithFormat:@"%ld.",indexPath.row + 1]
                                                     color:[UIColor orangeColor]
                                                      font:[UIFont fontWithName:@"Marker Felt" size:16]];
    
    //设置中文倾斜
    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(5 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix:matrix];//取得系统字符并设置反射。
    UIFont *font = [UIFont fontWithDescriptor :desc size :16];
    [titleStr appendAttributedString: [self markString:[NSString stringWithFormat:@"  %@",[rowDic objectForKey:@"title"]]
                                                 color:[UIColor grayColor]
                                                  font:font]];
    cell.textLabel.attributedText = titleStr;
    
    cell.detailTextLabel.text = [rowDic objectForKey:@"VCName"];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:8];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = indexPath.row %2 ==0?[UIColor whiteColor]:AxcAE_TabBarRGB(248, 248, 248);
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.textAlignment = NSTextAlignmentCenter;
    header.textLabel.textColor = [UIColor orangeColor];
    header.textLabel.font = [UIFont systemFontOfSize:16];
    header.backgroundColor = [UIColor lightGrayColor];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *dic = self.dataArray[section];
    return [NSString stringWithFormat:@"- %@ -",[dic objectForKey:@"title"]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
// 富文本
- (NSMutableAttributedString *)markString:(NSString *)str color:(UIColor *)color font:(UIFont *)font{
    NSMutableAttributedString *attributedString_M = [[NSMutableAttributedString alloc] initWithString:str ];
    [attributedString_M addAttribute:NSForegroundColorAttributeName
                               value:color
                               range:NSMakeRange(0, str.length)];
    [attributedString_M addAttribute:NSFontAttributeName
                               value:font
                               range:NSMakeRange(0, str.length)];
    return attributedString_M;
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[
                       @{@"arr":@[@{@"VCName":@"BasedUsingTabBarVC",@"title":@"AxcAE_TabBar基础使用"},
                                  @{@"VCName":@"CustomImageTabBarVC",@"title":@"自定义TabBar背景图"},
                                  @{@"VCName":@"CustomImageSelColorTabBarVC",@"title":@"自定义TabBar背景图+选中颜色"},
                                  @{@"VCName":@"ImageTranslucentTabBarVC",@"title":@"自定义TabBar背景图+模糊效果"},
                                  @{@"VCName":@"BulgeCircularTabBarVC",@"title":@"TabBar中间圆形凸出"},
                                  @{@"VCName":@"MultipleBulgeCircularTabBarVC",@"title":@"TabBar多重圆形凸出"},
                                  @{@"VCName":@"BulgeSquareTabBarVC",@"title":@"TabBar矩形图片凸出"},
                                  @{@"VCName":@"MultipleBulgeHybridTabBarVC",@"title":@"TabBar多重混合凸出"},
                                  @{@"VCName":@"ItemSizeTabBarVC",@"title":@"按钮自定义大小"},
                                  @{@"VCName":@"ItemSizeAlignmentTabBarVC",@"title":@"按钮自定义对齐模式"},
                                  @{@"VCName":@"ItemSizeLayoutTabBarVC",@"title":@"按钮自定义布局模式"},
                                  @{@"VCName":@"ItemCustomBadgeTabBarVC",@"title":@"按钮自定义徽标"},
                                  @{@"VCName":@"ItemCustomAnimationTabBarVC",@"title":@"按钮自定义交互动画"},
                                  @{@"VCName":@"ItemTingColorTabBarVC",@"title":@"按钮自定义渲染图片"},
                                  @{@"VCName":@"ItemBackgroundColorTabBarVC",@"title":@"按钮自定义背景颜色"},
                                  @{@"VCName":@"ItemBackgroundImageTabBarVC",@"title":@"按钮自定义背景图"}],
                         @"title":@"使用方法"},
                       
                       @{@"arr":@[@{@"VCName":@"HybridGradientHelperTabBarVC",@"title":@"与WHGradientHelper混合使用"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC",@"title":@"WHGradientHelper渐变色"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC2",@"title":@"WHGradientHelper渐变色2"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC3",@"title":@"WHGradientHelper渐变色3"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC4",@"title":@"WHGradientHelper渐变色4"},
                                  @{@"VCName":@"WHGradientHelperGradientItemTabBarVC",@"title":@"WHGradientHelper按钮渐变色"}],
                         @"title":@"WHGradientHelper混合示例" },
                       
                       @{@"arr":@[@{@"VCName":@"WeiBoTabBarVC",@"title":@"微博TabBar"},
                                  @{@"VCName":@"SaltedFishTabBarVC",@"title":@"咸鱼TabBar"},
                                  @{@"VCName":@"JianShuTabBarVC",@"title":@"简书TabBar"}],
                         @"title":@"模仿示例" },
                       
                       @{@"arr":@[@{@"VCName":@"PushHiddenTabBarVC",@"title":@"TabBar使用相关"}],
                         @"title":@"适配示例" }
                       ].copy;
    }
    return _dataArray;
}

@end
