//
//  RestaurantRequest.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "RestaurantRequest.h"


@interface RestaurantRequest ()
{
    NSMutableData *_responseData;
    
    NSArray *nameRestaurants;
}

@property (nonatomic,weak) id<RestaurantRequestDelegate> delegate;
@property (nonatomic,retain) NSURLRequest *urlRequest;
@property (nonatomic,retain) NSURLConnection *connection;
@property (nonatomic) NSString * serverInfo;

@end

@implementation RestaurantRequest
-(id) init
{
    self = [super init];
    if (self)
    {
        //self.serverInfo = @"http://172.16.3.72:8080";
        self.serverInfo = @"http://192.168.1.53:8080";
    }
    return self;
}

-(void) pedirInformacoesRestaurant:(NSString *)nomeRestaurant delegate:(id<RestaurantRequestDelegate>)delegate
{
    [self setDelegate:delegate];
    
}

-(void) pedirTodasInformacoes:(id<RestaurantRequestDelegate>)delegate
{
    [self setDelegate:delegate];
    self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@/restaurants", self.serverInfo ]]];
    self.connection = [NSURLConnection connectionWithRequest:self.urlRequest delegate:self];
}


-(void)enviarRestaurante: (NSDictionary *) dictionaryRestaurant
{
    //I prepare the string
    
    NSString *preparedString=[NSString stringWithFormat:@"%@ %@", self.lastDate, self.currentCategory];
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObject:preparedString forKey:@"request"];
    //Prepare convert to json string
    NSString *jsonRequest = [jsonDict JSONRepresentation];
    
    NSLog(@"jsonRequest is %@", jsonRequest);
    
    //Set the URL YOU WILL PROVIDE
    
    NSURL *url = [NSURL URLWithString:@"http:xxxxxxxxxxxxxxxxxxx"];
    
    //PREPARE the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //Prepare data which will contain the json request string.
    NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
    
    //Set the propreties of the request
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setValue:jsonRequest forHTTPHeaderField:@"Query-string"];
    //set the data prepared
    [request setHTTPBody: requestData];
    
    //Initialize the connection with request
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //Start the connection
    [delegate showIndicator];
    [connection start];
    
}


//delegate methods:

//METHODS TO HANßDLE RESPONSE
#pragma mark NSURLConnection delegate methods
//WHen receiving the response
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@" Did receive response");
    [responseData setLength:0];
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //While receiving the response data
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //When failed just log
    [delegate hideIndicator];
    NSLog(@"Connection failed!");
    NSLog(@"Error %@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //When the response data is downloaded
    // NSLog(@" Data obtained %@", responseData);
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    // NSLog(@" Response String %@", responseString);
    //converted response json string to a simple NSdictionary
    //If the response string is really JSONABLE I will have the data u sent me displayed succefully
    
    NSMutableArray *results = [responseString JSONValue];
    NSLog(@"Response: %@", results);
    /// la la al alal alaa
}



#pragma mark NSURLConnection Data Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    NSError *error = nil;
    //parsed data tem photos stat,
    NSDictionary *parsedData = _responseData ? [NSJSONSerialization JSONObjectWithData:_responseData options:0 error:&error] : nil;
    if (error)
    {
        NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
        if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)])
        {
            [self.delegate request:self didFailWithError:error];
        }
        return;
    }
    else
    {
        self.allRestaurants = parsedData;
        [self.delegate request:self didFinishWithObject:self.allRestaurants];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    
    if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)])
    {
        [self.delegate request:self didFailWithError:error];
    }
}

@end

