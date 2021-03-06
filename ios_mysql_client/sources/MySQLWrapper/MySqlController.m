//
//  MySqlController.m
//  ios_mysql_client
//
//  Created by Maxim Bilan on 21/11/13.
//  Copyright (c) 2013 Maxim Bilan. All rights reserved.
//

#import "MySqlController.h"
#import "MySqlDB.h"
#import "MySqlTable.h"

@implementation MySqlController

- (instancetype)init
{
    self = [super init];
    if (self) {
        db = [[MySqlDB alloc] init];
        tables = [[NSMutableArray alloc] init];
        
        [self initTables];
    }
    return self;
}

- (void)initTables
{
}

- (void)connectToServer:(NSString *)serverName withDbName:(NSString *)dbName
             withSocket:(NSString *)socket withPort:(unsigned int)port
           withUsername:(NSString *)username withPassword:(NSString *)password
{
    [db setSocket:socket];
    [db setServerName:serverName];
    [db setDbName:dbName];
    [db setPort:port];
    [db setUserName:username];
    [db setPassword:password];
    [db connect];
}

- (void)disconnect
{
    [db disconnect];
}

- (MySqlTable *)getTableById:(NSInteger)tableId
{
    for (MySqlTable *table in tables) {
        if ([table tableId] == tableId) {
            return table;
        }
    }
    
    return nil;
}

@end
