# MasonryLearn-1
学下Masonry使用

<http://adad184.com/2014/09/28/use-masonry-to-quick-solve-autolayout/>

<http://www.cnblogs.com/fwx2015/p/4868166.html>

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
##### 让一个view略小于其superView（边距为10）
    UIView *sv1 = [UIView new];
    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
##### 让两个高度为150的View垂直居中且等宽且等间隔排列 间隔为10
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
##### 在UIScrollView顺序排列一些View并且自动计算contentSize
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
	//container这个View起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
##### 横向或者纵向等间隙的排列一组View
	UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12, sv13]);
        make.centerX.equalTo(@[sv21, sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [sv distributeSpacingHorizontallyWith:@[sv11, sv12, sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11, sv21, sv31]];
    
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];


##### Other

	//  make.top.equalTo(superview.top).offset(padding);
        make.top.equalTo(superview).offset(padding);

	//  make.width.equalTo(greenView.mas_width);
        make.height.equalTo(@[greenView, blueView]);

	//  make.height.equalTo(@[greenView.mas_height, redView.mas_height]); 
		make.height.equalTo(@[greenView, redView]);
		
		make.width.equalTo(self.topInnerView.mas_height).multipliedBy(3);
		
		make.width.and.height.equalTo(self.topView).priorityLow();
		
		self.longLabel.preferredMaxLayoutWidth = width;
		
		//Array
		self.buttonViews = @[ raiseButton, lowerButton, centerButton ];
		- (void)setOffset:(CGFloat)offset {
    		_offset = offset;
    		[self setNeedsUpdateConstraints];
		}

		- (void)updateConstraints {
   		 	[self.buttonViews updateConstraints:^(MASConstraintMaker *make) {
        		make.baseline.equalTo(self.mas_centerY).with.offset(self.offset);
   	 		}];
    		//according to apple super should be called at end of method
    		[super updateConstraints];
		}

##### mas_updateConstraints   mas_remakeConstraints
	requiresConstraintBasedLayout ：我们应该在自定义View中重写这个方法。如果我们要使用Auto Layout布局当前视图，应该设置为返回YES
	
	+ (BOOL)requiresConstraintBasedLayout
	{
   		 return YES;
	}

	// this is Apple's recommended place for adding/updating constraints
	- (void)updateConstraints {
    
    	[self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
       	    make.center.equalTo(self);
           	make.width.equalTo(@(self.buttonSize.width)).priorityLow();
        	make.height.equalTo(@(self.buttonSize.height)).priorityLow();
        	make.width.lessThanOrEqualTo(self);
        	make.height.lessThanOrEqualTo(self);
    	}];
    
    	//according to apple super should be called at end of method
    	[super updateConstraints];
	}

	- (void)didTapGrowButton:(UIButton *)button {
    	self.buttonSize = CGSizeMake(self.buttonSize.width * 1.3, self.buttonSize.height * 1.3);
    
    	// tell constraints they need updating
    	[self setNeedsUpdateConstraints];
    	// update constraints now so we can animate the change
    	[self updateConstraintsIfNeeded];
    
    	[UIView animateWithDuration:0.4 animations:^{
       		 [self layoutIfNeeded];
    	}];
	}
	
	// this is Apple's recommended place for adding/updating constraints
	- (void)updateConstraints {
    
    	[self.movingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        	make.width.equalTo(@(100));
        	make.height.equalTo(@(100));
        
        	if (self.topLeft) {
            	make.left.equalTo(self).with.offset(10);
            	make.top.equalTo(self).with.offset(10);
        	} else {
            	make.bottom.equalTo(self).with.offset(-10);
            	make.right.equalTo(self).with.offset(-10);
        	}
    	}];
    
    	//according to apple super should be called at end of method
    	[super updateConstraints];
	}
##### Debugging Helpers
	//you can attach debug keys to views like so:
    //    greenView.mas_key = @"greenView";
    //    redView.mas_key = @"redView";
    //    blueView.mas_key = @"blueView";
    //    superview.mas_key = @"superview";
    
    //OR you can attach keys automagically like so:
    MASAttachKeys(greenView, redView, blueView, superview);
    
    //you can also attach debug keys to constaints
    make.edges.equalTo(@1).key(@"ConflictingConstraint"); //composite constraint keys will be indexed
    make.height.greaterThanOrEqualTo(@5000).key(@"ConstantConstraint");

##### Attribute Chaining
	UIEdgeInsets padding = UIEdgeInsetsMake(15, 10, 15, 10);
	// chain attributes
    make.top.and.left.equalTo(superview).insets(padding);
	
##### 2个或2个以上控件等间隔排序
	[arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:20 leadSpacing:5 tailSpacing:5];
    [arr makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@60);
    }];
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:30 leadSpacing:200 tailSpacing:30];
    [arr makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.height.equalTo(@60);
    }];
	
	/**
 	*  多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
 	*
 	*  @param axisType        轴线方向
 	*  @param fixedSpacing    间隔大小
 	*  @param leadSpacing     头部间隔
 	*  @param tailSpacing     尾部间隔
 	*/
	- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType 
                    withFixedSpacing:(CGFloat)fixedSpacing l
                          eadSpacing:(CGFloat)leadSpacing 
                         tailSpacing:(CGFloat)tailSpacing;

	/**
	 *  多个固定大小的控件的等间隔排列,变化的是间隔的空隙
	 *
	 *  @param axisType        轴线方向
	 *  @param fixedItemLength 每个控件的固定长度或者宽度值
	 *  @param leadSpacing     头部间隔
	 *  @param tailSpacing     尾部间隔
	 */
	- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType 
                 withFixedItemLength:(CGFloat)fixedItemLength 
                         leadSpacing:(CGFloat)leadSpacing 
                         tailSpacing:(CGFloat)tailSpacing;
                         
                         
                         
	setNeedsLayout：告知页面需要更新，但是不会立刻开始更新。执行后会立刻调用layoutSubviews。
	layoutIfNeeded：告知页面布局立刻更新。所以一般都会和setNeedsLayout一起使用。如果希望立刻生成新的frame需要调用	此方法，利用这点一般布局动画可以在更新布局后直接使用这个方法让动画生效。
	layoutSubviews：系统重写布局
	setNeedsUpdateConstraints：告知需要更新约束，但是不会立刻开始
	updateConstraintsIfNeeded：告知立刻更新约束
	updateConstraints：系统更新约束
	
##### Composition
	edges
	// make top, left, bottom, right equal view2
	make.edges.equalTo(view2);

	// make top = superview.top + 5, left = superview.left + 10,
	//      bottom = superview.bottom - 15, right = superview.right - 20
	make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20))
	
	size
	// make width and height greater than or equal to titleLabel
	make.size.greaterThanOrEqualTo(titleLabel)

	// make width = superview.width + 100, height = superview.height - 50
	make.size.equalTo(superview).sizeOffset(CGSizeMake(100, -50))
	
	center
	// make centerX and centerY = button1
	make.center.equalTo(button1)

	// make centerX = superview.centerX - 5, centerY = superview.centerY + 10
	make.center.equalTo(superview).centerOffset(CGPointMake(-5, 10))
	You can chain view attributes for increased readability:

	// All edges but the top should equal those of the superview
	make.left.right.and.bottom.equalTo(superview);
	make.top.equalTo(otherView);
