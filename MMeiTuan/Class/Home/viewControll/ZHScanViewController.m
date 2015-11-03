//
//  ZHScanViewController.m
//  MMeiTuan
//
//  Created by Zheng on 15/11/3.
//  Copyright © 2015年 zhr. All rights reserved.
//

#import "ZHScanViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ZHScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    AVCaptureSession                *_session;
}

@end

@implementation ZHScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self navControler];
    
    [self OpentScan];
    UIImageView  * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
    imageView.image = [UIImage imageNamed:@"green"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //self.navigationController.navigationBarHidden = NO;
}
-(void)navControler{
    UIButton  * lftbut = [UIButton buttonWithType:UIButtonTypeCustom];
    lftbut.frame = CGRectMake(10, 20, 30, 30);
    [lftbut setBackgroundImage:[UIImage imageNamed:@"selecte_home"] forState:UIControlStateNormal];
    [lftbut addTarget:self action:@selector(leftButItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lftbut];
    
}
-(void)leftButItem{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)OpentScan{
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    CGFloat topMargin = 128.0;
    //    output.rectOfInterest = CGRectMake(y坐标/父bounds.高, x坐标/父bounds.宽, 高/父bounds.高, 宽/父bounds.宽);
    output.rectOfInterest = CGRectMake(topMargin/kHeight, (kWidth-255)/2/kWidth, 255/kHeight, 255/kWidth);
    
    //初始化链接对象
    _session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [_session addInput:input];
    [_session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [_session startRunning];

}
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


















