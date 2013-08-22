//
//  ViewController.m
//  sumple2
//
//  Created by CA on 13/08/20.
//  Copyright (c) 2013年 CA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TapBtn:(id)sender {
    UIImage *rank1 = [UIImage imageNamed:@"kita_test.png"];
    UIImage *rank2 = [UIImage imageNamed:@"miya_test.png"];
    UIImage *rank3 = [UIImage imageNamed:@"gakki_test.png"];
    
    [self.resultImage setImage:[self composition1:rank1 andcomposition2:rank2 andcomposition3:rank3]];
}

- (UIImage*)composition1:(UIImage*)anImage1 andcomposition2:(UIImage*)anImage2 andcomposition3:(UIImage*)anImage3 {
    
    CGImageRef imageRef1;
    imageRef1 = anImage1.CGImage;
    
    CGImageRef imageRef2;
    imageRef2 = anImage2.CGImage;
    
    CGImageRef imageRef3;
    imageRef3 = anImage3.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef1);
    size_t height = CGImageGetHeight(imageRef1);
    
    // ピクセルを構成するRGB各要素が何ビットで構成されている
    size_t bitsPerComponent1;
    bitsPerComponent1 = CGImageGetBitsPerComponent(imageRef1);
    // ピクセル全体は何ビットで構成されているか
    size_t bitsPerPixel1;
    bitsPerPixel1 = CGImageGetBitsPerPixel(imageRef1);
    // 画像の横1ライン分のデータが、何バイトで構成されているか
    size_t bytesPerRow1;
    bytesPerRow1 = CGImageGetBytesPerRow(imageRef1);
    // 画像の色空間
    CGColorSpaceRef colorSpace1;
    colorSpace1 = CGImageGetColorSpace(imageRef1);
    // 画像のBitmap情報
    CGBitmapInfo bitmapInfo1;
    bitmapInfo1 = CGImageGetBitmapInfo(imageRef1);
    // 画像がピクセル間の補完をしているか
    bool shouldInterpolate1;
    shouldInterpolate1 = CGImageGetShouldInterpolate(imageRef1);
    // 表示装置によって補正をしているか
    CGColorRenderingIntent  intent1;
    intent1 = CGImageGetRenderingIntent(imageRef1);
    // 画像のデータプロバイダを取得する
    CGDataProviderRef   dataProvider1;
    dataProvider1 = CGImageGetDataProvider(imageRef1);
    // データプロバイダから画像のbitmap生データ取得
    CFDataRef   data1;
    UInt8*      buffer1;
    data1 = CGDataProviderCopyData(dataProvider1);
    buffer1 = (UInt8*)CFDataGetBytePtr(data1);
    
    
    // 画像の横1ライン分のデータが、何バイトで構成されているか
    size_t bytesPerRow2;
    bytesPerRow2 = CGImageGetBytesPerRow(imageRef2);
    // 画像のデータプロバイダを取得する
    CGDataProviderRef dataProvider2;
    dataProvider2 = CGImageGetDataProvider(imageRef2);
    // データプロバイダから画像のbitmap生データ取得
    CFDataRef   data2;
    UInt8*      buffer2;
    data2 = CGDataProviderCopyData(dataProvider2);
    buffer2 = (UInt8*)CFDataGetBytePtr(data2);
    
    
    // 画像の横1ライン分のデータが、何バイトで構成されているか
    size_t bytesPerRow3;
    bytesPerRow3 = CGImageGetBytesPerRow(imageRef3);
    // 画像のデータプロバイダを取得する
    CGDataProviderRef dataProvider3;
    dataProvider3 = CGImageGetDataProvider(imageRef3);
    // データプロバイダから画像のbitmap生データ取得
    CFDataRef   data3;
    UInt8*      buffer3;
    data3 = CGDataProviderCopyData(dataProvider3);
    buffer3 = (UInt8*)CFDataGetBytePtr(data3);
    
    
    // 1ピクセルずつ画像を処理
    NSUInteger  x1, y1;
    for (y1 = 0; y1 < height; y1++) {
        for (x1 = 0; x1 < width; x1++) {
            UInt8*  tmp1;
            UInt8*  tmp2;
            UInt8*  tmp3;
            tmp1 = buffer1 + y1*bytesPerRow1 + x1*4; // RGBAの4つ値をもっているので、1ピクセルごとに*4してずらす
            tmp2 = buffer2 + y1*bytesPerRow2 + x1*4; // RGBAの4つ値をもっているので、1ピクセルごとに*4してずらす
            tmp3 = buffer3 + y1*bytesPerRow3 + x1*4; // RGBAの4つ値をもっているので、1ピクセルごとに*4してずらす
            
            // RGB値を取得
            UInt8 red1,green1,blue1;
            // UInt8 A1;
            
            red1   = *(tmp1 + 0)*0.2 + *(tmp2 + 0)*0.3 + *(tmp3 + 0)*0.5;
            green1 = *(tmp1 + 1)*0.2 + *(tmp2 + 1)*0.3 + *(tmp3 + 1)*0.5;
            blue1  = *(tmp1 + 2)*0.2 + *(tmp2 + 2)*0.3 + *(tmp3 + 2)*0.5;
            
            //A1 = (*(tmp1+3)+*(tmp2+3)+*(tmp3+3))/3;
            /*
             
             if(A1<10)
             A1=0;
             */
            
            *(tmp1 + 0) = red1;
            *(tmp1 + 1) = green1;
            *(tmp1 + 2) = blue1;
            /*
             // 輝度計算
             UInt8 brightness1;
             brightness1 = (77*red1 + 28*green1 + 151*blue1) / 256;
             
             
             if (brightness1 >150 && red1 < 190 ) {
             *(tmp1 + 0) = 255;
             *(tmp1 + 1) = 255;
             *(tmp1 + 2) = 255;
             }
             */
            /*
             *(tmp1 + 0) = brightness1;
             *(tmp1 + 1) = brightness1;
             *(tmp1 + 2) = brightness1;
             */
            
        }
    }
    
    // 効果を与えたデータ生成
    CFDataRef   effectedData;
    effectedData = CFDataCreate(NULL, buffer1, CFDataGetLength(data1));
    
    // 効果を与えたデータプロバイダを生成
    CGDataProviderRef   effectedDataProvider;
    effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    // 画像を生成
    CGImageRef  effectedCgImage;
    UIImage*    effectedImage;
    effectedCgImage = CGImageCreate(
                                    width, height,
                                    bitsPerComponent1, bitsPerPixel1, bytesPerRow1,
                                    colorSpace1, bitmapInfo1, effectedDataProvider,
                                    NULL, shouldInterpolate1, intent1);
    effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];
    
    // データの解放
    CGImageRelease(effectedCgImage);
    CFRelease(effectedDataProvider);
    CFRelease(effectedData);
    CFRelease(data1);
    
    return effectedImage;
    
}

@end
