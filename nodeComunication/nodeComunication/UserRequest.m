//
//  UserRequest.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 03/02/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "UserRequest.h"
@interface UserRequest ()
{
    NSMutableData *_responseData;
    
    NSArray *nameRestaurants;
}

@property (nonatomic,weak) id<UserRequestDelegate> delegate;
@property (nonatomic,retain) NSURLRequest *urlRequest;
@property (nonatomic,retain) NSURLConnection *connection;
@property (nonatomic) NSString * serverInfo;

@end

@implementation UserRequest
-(id) init
{
    self = [super init];
    if (self)
    {
        self.serverInfo = @"http://172.16.3.72:8080";   //Eldorado
        // self.serverInfo = @"http://192.168.1.53:8080"; //Casa
    
        self.usuario = [[User alloc] init];
    }
    return self;
}

-(void) pedirInformacoesUsuario:(NSString *)nomeRestaurant delegate:(id<UserRequestDelegate>)delegate
{
    [self setDelegate:delegate];
    
}

-(void) pedirTodasInformacoes:(id<UserRequestDelegate>)delegate
{
    [self setDelegate:delegate];
    self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@/users", self.serverInfo ]]];
    self.connection = [NSURLConnection connectionWithRequest:self.urlRequest delegate:self];
}


-(void) enviarUsuario: (NSDictionary *) dictionaryUser andDelegate: (id<UserRequestDelegate>) delegate
{
    
    
    NSLog(@"nsdicitionary enviado: %@", dictionaryUser);
    
    //montando Json
    NSError *error = nil;
    NSData *jsonUserData = [NSJSONSerialization dataWithJSONObject:dictionaryUser options:0 error: &error]; //montar json
    NSLog(@" json montado : %@", jsonUserData);
    

    //montando URL
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"%@/users",self.serverInfo]];
    
    //preparando a requisicao
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //Prepare data which will contain the json request string.
    
    //NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
    
    //cofigurando envio!
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [jsonUserData length]] forHTTPHeaderField:@"Content-Length"];
    
    //set the data prepared
    [request setHTTPBody: jsonUserData];
    
    //Initialize the connection with request
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //Start the connection
    
    //[delegate showIndicator];   Nao sei o que isso faz
    [connection start];
    
}


//delegate methods:

//METHODS TO HANßDLE RESPONSE
#pragma mark NSURLConnection delegate methods
//WHen receiving the response
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    NSLog(@" Did receive response");
   // [_responseData setLength:0];
    _responseData = [[NSMutableData alloc] init];


}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //While receiving the response data
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    
    if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)])
    {
        [self.delegate request:self didFailWithError:error];
    }
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
        self.allUsers = parsedData;
        [self.delegate request:self didFinishWithObject:self.allUsers];
    }
}


@end
