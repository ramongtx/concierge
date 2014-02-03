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
        self.serverInfo = @"http://172.16.3.72:8080";   //Eldorado
       // self.serverInfo = @"http://192.168.1.53:8080"; //Casa
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


-(void) enviarRestaurante: (NSDictionary *) dictionaryRestaurant andDelegate: (id<RestaurantRequestDelegate>) delegate
{
    
    NSLog(@"nsdicitionary enviado: %@", dictionaryRestaurant);
    
    //montando Json
    NSError *error = nil;
    NSData *jsonRestaurantData = [NSJSONSerialization dataWithJSONObject:dictionaryRestaurant options:0 error: &error]; //montar json
    NSLog(@" json montado : %@", jsonRestaurantData);
    

    //montando URL
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"%@/restaurants",self.serverInfo]];
    
    //preparando a requisicao
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //----------------------------------codigo de estudo -----------------------------------------------------------------
   
    //----------------------------------codigo de estudo -----------------------------------------------------------------
    
    //cofigurando envio!
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [jsonRestaurantData length]] forHTTPHeaderField:@"Content-Length"];

//    NSString *string = [[NSString alloc] initWithData:jsonRestaurantData encoding:NSUTF8StringEncoding];

  //  [request setValue:string forHTTPHeaderField:@"Query-string"];
    //set the data prepared
    [request setHTTPBody: jsonRestaurantData];
    
    //Initialize the connection with request
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //Start the connection
    
    //[delegate showIndicator];   Nao sei o que isso faz
    [connection start];
    
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

