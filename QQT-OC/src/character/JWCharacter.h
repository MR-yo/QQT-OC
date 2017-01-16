//
//  JWCharacter.h
//  QQT-OC
//
//  Created by 一只皮卡丘 on 2017/1/13.
//  Copyright © 2017年 一只皮卡丘. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, JWCharacterType) {
    JWCharacterTypeSuperMan,
    JWCharacterTypeSuperWomen
};

typedef NS_ENUM(NSUInteger, JWCharacterStatus) {
    JWCharacterLive,
    JWCharacterStrand,
    JWCharacterDead
};

@interface JWCharacter : SKSpriteNode

@property (nonatomic, assign) int bompNumber;
@property (nonatomic, assign) int bompPower;
@property (nonatomic, assign) JWCharacterType type;
@property (nonatomic, assign) JWCharacterStatus status;

+ (instancetype)initWithType:(JWCharacterType)type;

@end
