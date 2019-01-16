//
//  BRSImagesDownloader.m
//  Applozic
//
//  Created by Joanna Zatorska on 16/01/2019.
//

#import "BRSImagesDownloader.h"
#import "SDImageCache.h"

@implementation BRSImagesDownloader

+ (void)updateImageView:(UIImageView *)imageView with:(NSURL *)imageUrl placeholderImage:(UIImage *)placeholder  {
    UIImage *cachedImage = [SDImageCache.sharedImageCache imageFromDiskCacheForKey:imageUrl.absoluteString];
    
    if (cachedImage) {
        imageView.image = cachedImage;
        [imageView setNeedsDisplay];
        return;
    }

    NSURLSessionDownloadTask *downloadTask = [NSURLSession.sharedSession downloadTaskWithURL:imageUrl completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *downloadedImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:location]];
            
            if (!downloadedImage && placeholder) {
                imageView.image = placeholder;
                [imageView setNeedsDisplay];
                return;
            }
            imageView.image = downloadedImage;
            [imageView setNeedsDisplay];
            
            [SDImageCache.sharedImageCache storeImage:downloadedImage forKey:imageUrl.absoluteString toDisk:YES completion:nil];
        });
    }];
    [downloadTask resume];
}

@end
