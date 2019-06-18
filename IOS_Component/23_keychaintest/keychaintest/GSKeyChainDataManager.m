//
//  GSKeyChainDataManager.m
//  keychaintest
//
//  Created by Apple on 16/8/2.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "GSKeyChainDataManager.h"
#import "GSKeyChain.h"	
#import <UIKit/UIKit.h>

@implementation GSKeyChainDataManager

static NSString * const KEY_IN_KEYCHAIN_UUID = @"唯一识别的KEY_UUID";
static NSString * const KEY_UUID = @"唯一识别的key_uuid";

+(void)saveUUID:(NSString *)UUID{
    
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:UUID forKey:KEY_UUID];
    
    [GSKeyChain save:KEY_IN_KEYCHAIN_UUID data:usernamepasswordKVPairs];
}

+(NSString *)readUUID{
    
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[GSKeyChain load:KEY_IN_KEYCHAIN_UUID];
    
    //return [usernamepasswordKVPair objectForKey:KEY_UUID];
    // change it, if read is nil then save it
    NSString *getUDIDInKeychain = [usernamepasswordKVPair objectForKey:KEY_UUID];
    NSLog(@" readUUID getUDIDInKeychain is %@", getUDIDInKeychain);
    if (!getUDIDInKeychain ||[getUDIDInKeychain isEqualToString:@""]||[getUDIDInKeychain isKindOfClass:[NSNull class]]) {
        
        //create
        NSString *deviceUUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
        //save
        [GSKeyChainDataManager saveUUID:deviceUUID];
        //load
        usernamepasswordKVPair = (NSMutableDictionary *)[GSKeyChain load:KEY_IN_KEYCHAIN_UUID];
        //get again
        getUDIDInKeychain = [usernamepasswordKVPair objectForKey:KEY_UUID];
        NSLog(@" after save getUDIDInKeychain is %@", getUDIDInKeychain);
    }
    
    NSLog(@" finnally readUUID getUDIDInKeychain is %@", getUDIDInKeychain);
    return getUDIDInKeychain;
    
    
    
    
}

+(void)deleteUUID{
    
    [GSKeyChain delete:KEY_IN_KEYCHAIN_UUID];
    
}

@end
