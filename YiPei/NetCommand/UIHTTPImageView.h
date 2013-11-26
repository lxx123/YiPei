

#import "ASIHTTPRequest.h"

@interface UIHTTPImageView : UIImageView {
    ASIHTTPRequest *request;
}

- (void)setImageWithURL:(NSURL *)url;

@end