# MasonryLearn-1
学下Masonry使用

Masonry是一个轻量级的布局框架 拥有自己的描述语法 采用更优雅的链式语法封装自动布局 简洁明了 并具有高可读性

##### 居中显示一个view
	UIView *sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIView *sv1 = [UIView new];
    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    ![image](http://cl.ly/image/0b0v1m1d0g0f)
##### 让一个view略小于其superView（边距为10）
    UIView *sv1 = [UIView new];
    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
#### 让两个高度为150的View垂直居中且等宽且等间隔排列 间隔为10
    int padding = 10;
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor orangeColor];
    [sv2 showPlaceHolder];
    [sv addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor orangeColor];
    [sv3 showPlaceHolder];
    [sv addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sv.mas_left).offset(padding);
        make.right.equalTo(sv3.mas_left).offset(-padding);
        make.centerY.equalTo(sv);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sv2.mas_right).offset(padding);
        make.right.equalTo(sv.mas_right).offset(-padding);
        make.centerY.equalTo(sv);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
#### 在UIScrollView顺序排列一些View并且自动计算contentSize
	UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [UIView new];
    container.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:container];
    [container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for (int i = 0; i < count; i++) {
        
        UIView *subv = [UIView new];
        [container addSubview:subv];
        
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(container.mas_top);
            }
            
        }];
        
        lastView = subv;
        
    }
    
    [container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];


