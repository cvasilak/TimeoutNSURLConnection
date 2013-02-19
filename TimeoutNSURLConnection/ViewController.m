//
//  ViewController.m
//  TimeoutNSURLConnection
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:8080/RESTfulExample/services/message"];
    //NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:8080/RESTfulExample/services/message/post"];
    //NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:8080/RESTfulExample/services/message/put"];
    //NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:8080/RESTfulExample/services/message/delete"];
    
	NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [req setHTTPMethod:@"GET"];
    
    // set the body of requests for PUT/POST
//  [req setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@", @"utf-8"] forHTTPHeaderField:@"Content-Type"];
    
//    NSString *postString = @"name=Christos";
//    [req setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [req setTimeoutInterval:2];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc]
                                    initWithRequest:req
                                    delegate:self];
    
}

#pragma mark -
#pragma mark NSURLConnection Callbacks
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Response Code: %d\n", [(NSHTTPURLResponse *)response statusCode]);
    NSLog(@"Content-Type: %@\n", [[(NSHTTPURLResponse *)response allHeaderFields] objectForKey:@"Content-Type"]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {  
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
}
@end
