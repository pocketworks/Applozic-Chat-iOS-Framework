//
//  BRSImagesDownloader.h
//  Applozic
//
//  Created by Joanna Zatorska on 16/01/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRSImagesDownloader : NSObject
+ (void)updateImageView:(UIImageView *)imageView with:(NSURL *)imageUrl placeholderImage:(nullable UIImage *)placeholder;
@end

NS_ASSUME_NONNULL_END
