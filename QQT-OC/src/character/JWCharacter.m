//
//  JWCharacter.m
//  QQT-OC
//
//  Created by 一只皮卡丘 on 2017/1/13.
//  Copyright © 2017年 一只皮卡丘. All rights reserved.
//

#import "JWCharacter.h"

@implementation JWCharacter

+ (instancetype)initWithType:(JWCharacterType)type
{
    JWCharacter *character = (JWCharacter *)[JWCharacter spriteNodeWithTexture:[SKTexture textureWithImage:[NSImage imageNamed:@"1"]]];
    character.type = type;
    character.bompPower = 10;
    character.bompNumber = 10;
    character.status = JWCharacterLive;
    return character;
}

@end
