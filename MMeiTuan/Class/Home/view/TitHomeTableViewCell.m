//
//  TitHomeTableViewCell.m
//  MMeiTuan
//
//  Created by Zheng on 15/10/30.
//  Copyright © 2015年 zhr. All rights reserved.
//

#import "TitHomeTableViewCell.h"

@interface TitHomeTableViewCell ()<UIScrollViewDelegate>{
    UIView              *_oneView;
    UIView              *_twoView;
    UIPageControl       *_pageControl;
}

@end

@implementation TitHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIScrollView   * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 180)];
        scrollView.contentSize = CGSizeMake(kWidth*2, 180);
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        
        _oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 160)];
        
        _twoView = [[UIView alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth, 160)];
       
        [scrollView addSubview:_oneView];
        [scrollView addSubview:_twoView];
        
        
        for (NSInteger i =0; i<20; i++) {
            if (i<5) {
                CGRect  from = CGRectMake(i*kWidth/5, 0, kWidth/5, 80);
                CGFloat  fromWith = from.size.width;
                UIView  * metuView = [[UIView alloc] initWithFrame:from];
                metuView.tag = 100+i;
                [_oneView addSubview:metuView];
                
                UIImageView   *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(fromWith/2-20, 20, 40, 40)];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image-%ld",i]];
                [metuView addSubview:imageView];
                
                UILabel  * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), fromWith, 20)];
                lab.text = [NSString stringWithFormat:@"%ld",i];
                lab.textAlignment = NSTextAlignmentCenter;
                [metuView addSubview:lab];
                
                UITapGestureRecognizer  * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerView:)];
                [metuView addGestureRecognizer:gesture];
            }else if (i<10){
                CGRect  from = CGRectMake((i-5)*kWidth/5, 80, kWidth/5, 80);
                CGFloat  fromWith = from.size.width;
                UIView  * metuView = [[UIView alloc] initWithFrame:from];
                metuView.tag = 100+i;
                [_oneView addSubview:metuView];
                
                UIImageView   *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(fromWith/2-20, 20, 40, 40)];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image-%ld",i]];
                [metuView addSubview:imageView];
                
                UILabel  * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), fromWith, 20)];
                lab.text = [NSString stringWithFormat:@"%ld",i];
                lab.textAlignment = NSTextAlignmentCenter;
                [metuView addSubview:lab];
                

                UITapGestureRecognizer  * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerView:)];
                [metuView addGestureRecognizer:gesture];
            }else if (i<15){
                CGRect  from = CGRectMake((i-10)*kWidth/5, 0, kWidth/5, 80);
                CGFloat  fromWith = from.size.width;
                UIView  * metuView = [[UIView alloc] initWithFrame:from];
                
                metuView.tag = 100+i;
                [_twoView addSubview:metuView];
                
                UIImageView   *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(fromWith/2-20, 20, 40, 40)];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image-%ld",i]];
                [metuView addSubview:imageView];
                
                UILabel  * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), fromWith, 20)];
                lab.text = [NSString stringWithFormat:@"%ld",i];
                lab.textAlignment = NSTextAlignmentCenter;
                [metuView addSubview:lab];
                
                UITapGestureRecognizer  * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerView:)];
                [metuView addGestureRecognizer:gesture];
            }else{
                CGRect  from = CGRectMake((i-15)*kWidth/5, 80, kWidth/5, 80);
                CGFloat  fromWith = from.size.width;
                UIView  * metuView = [[UIView alloc] initWithFrame:from];
                metuView.tag = 100+i;
                [_twoView addSubview:metuView];
                
                UIImageView   *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(fromWith/2-20, 20, 40, 40)];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image-%ld",i]];
                [metuView addSubview:imageView];
                
                UILabel  * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), fromWith, 20)];
                lab.text = [NSString stringWithFormat:@"%ld",i];
                lab.textAlignment = NSTextAlignmentCenter;
                [metuView addSubview:lab];
                
                UITapGestureRecognizer  * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerView:)];
                [metuView addGestureRecognizer:gesture];
            }
        }
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kWidth/2-10, 160, 0, 20)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 2;
        [self addSubview:_pageControl];
        [_pageControl setPageIndicatorTintColor:[UIColor redColor]];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor greenColor]];
    }
    return self;
}

#pragma mark - 添加手势
-(void)gestureRecognizerView:(UITapGestureRecognizer *)gesture{
    NSLog(@"---%ld",gesture.view.tag);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat  scrollViewWith = scrollView.frame.size.width;
    CGFloat  x = scrollView.contentOffset.x;
    NSInteger  pag = (x + scrollViewWith/2)/scrollViewWith;
    _pageControl.currentPage = pag;
}
@end













