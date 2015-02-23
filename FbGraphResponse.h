
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FbGraphResponse : NSObject {

	NSString *htmlResponse;
	UIImage *imageResponse;
	NSError *error;
	
}

@property (nonatomic, retain) NSString *htmlResponse;
@property (nonatomic, retain) UIImage *imageResponse;
@property (nonatomic, retain) NSError *error;

@end
