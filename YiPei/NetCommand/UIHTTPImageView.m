
#import "UIHTTPImageView.h"

@implementation UIHTTPImageView        

- (void)dealloc {
    [request setDelegate:nil];
    [request cancel];
    [request release];
    [super dealloc];
}

- (void)setImageWithURL:(NSURL *)url{
    if (request) {
        [request setDelegate:nil];
        [request cancel];
        [request release]; 
    }
    request = [[ASIHTTPRequest requestWithURL:url] retain];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setSecondsToCache:60 * 60 * 24 * 30];
		
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)req {
    if (request.responseStatusCode != 200) {
        return;
	}
//	[request.responseData writeToFile:dPath atomically:NO];
    self.image = [UIImage imageWithData:request.responseData];
}

@end