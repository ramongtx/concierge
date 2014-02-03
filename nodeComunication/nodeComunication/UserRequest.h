//
//  UserRequest.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 03/02/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@class UserRequest;
@protocol UserRequestDelegate <NSObject>
@optional
-(void) request: (UserRequest*) request didFinishWithObject:(id) object;
-(void) request: (UserRequest*) request didFailWithError:(NSError*) error;
-(void) recarregarCollectionView;

@end

@interface UserRequest : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, strong) User * usuario;

@property (nonatomic, strong) NSDictionary *dataUser;
@property (nonatomic, strong) NSDictionary *allUsers;

-(void) pedirInformacoesUsuario:(NSString*) nomeUsuario delegate:(id<UserRequestDelegate >) delegate;

-(void) pedirTodasInformacoes:(id<UserRequestDelegate >) delegate;
-(void) enviarUsuario: (NSDictionary *) dictionaryuser andDelegate: (id<UserRequestDelegate>) delegate;
@end
