//
//  MainGameScene.m
//  QQT-OC
//
//  Created by 一只皮卡丘 on 2017/1/13.
//  Copyright © 2017年 一只皮卡丘. All rights reserved.
//

#import "MainGameScene.h"
#import "JWCharacter.h"

@interface MainGameScene ()

@property (nonatomic, strong) JWCharacter *player;
@property (nonatomic, assign) BOOL startMove;   //吃完道具更新状态


@end

@implementation MainGameScene

- (void)sceneDidLoad
{
    self.size = CGSizeMake(500, 500);
    self.backgroundColor = [SKColor whiteColor];
    self.anchorPoint = CGPointZero;
    [self loadCharacter];
}

- (void)loadCharacter
{
    _player = [JWCharacter initWithType:JWCharacterTypeSuperMan];
    _player.size = CGSizeMake(50, 70);
    _player.speed = 10;
    _player.position = CGPointMake(10, 10);
    _player.anchorPoint = CGPointZero;
    [self addChild:_player];
}

#pragma mark - 键盘按下
- (void)keyDown:(NSEvent *)theEvent
{
    switch (theEvent.keyCode) {
        case 0x31 /* SPACE */:
            break;
        case 0x7E /* ↑ */:
            [self userMove:theEvent x:0 y:_player.speed * 5 key:@"up"];
            break;
        case 0x7D /* ↓ */:
            [self userMove:theEvent x:0 y:-_player.speed * 5 key:@"down"];
            break;
        case 0x7B /* ← */:
            [self userMove:theEvent x:-_player.speed * 5 y:0 key:@"left"];
            break;
        case 0x7C /* → */:
            [self userMove:theEvent x:_player.speed * 5 y:0 key:@"right"];
            break;
        default:
            NSLog(@"keyDown:'%@' keyCode: 0x%02X", theEvent.characters, theEvent.keyCode);
            break;
    }
}



#pragma mark - 键盘抬起
- (void)keyUp:(NSEvent *)event
{
    switch (event.keyCode) {
        case 0x31 /* SPACE */:
            break;
        case 0x7E /* ↑ */:
            [self userStopMove:@"up"];
            break;
        case 0x7D /* ↓ */:
            [self userStopMove:@"down"];

            break;
        case 0x7B /* ← */:
            [self userStopMove:@"left"];

            break;
        case 0x7C /* → */:
            [self userStopMove:@"right"];

            break;
        default:
            NSLog(@"keyDown:'%@' keyCode: 0x%02X", event.characters, event.keyCode);
            break;
    }
}

- (void)userMove:(NSEvent *)event x:(CGFloat)x y:(CGFloat)y key:(NSString *)key
{
//    SKAction *moveAction  = [SKAction moveByX:x y:y duration:0.6];
//    [self.player runAction:moveAction];
//
//    SKAction *speedAction = [SKAction speedTo:5 duration:1];
//    
//    SKAction *groupAction = [SKAction group:@[moveAction,speedAction]];
    //绘制Path
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGRect rect = CGRectInset(self.view.bounds, _user.position.x, _user.position.y);
//    CGPathMoveToPoint(path, NULL, 2, 2);
//    CGPathAddLineToPoint(path, NULL, 20, 20);
//    
    
    //绘制Path
//    if (!_startMove) {
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPoint endPos = CGPointMake(0, 0);
//        CGPoint startPos = CGPointMake(0, _user.speed * 2);
//        CGPathMoveToPoint(path, nil, startPos.x, startPos.y);
////        CGPathMoveToPoint(path, nil, endPos.x, endPos.y);
//        CGPathAddLineToPoint(path, nil, endPos.x, endPos.y);
//        SKAction *pathAction =  [SKAction followPath:path speed:_user.speed];
//        [_user runAction:pathAction withKey:@"PathMove"];
//        CGPathRelease(path);
//        _startMove = YES;
//        NSLog(@"user.position1 = (%f,%f)",_user.position.x,_user.position.y);
//    }else{
//        NSLog(@"user.position2 = (%f,%f)",_user.position.x,_user.position.y);
//        SKAction *moveAction  = [SKAction moveByX:x y:y duration:1];
//        [_user runAction:moveAction withKey:@"PathMove"];
//    }
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint startPos = CGPointMake(0, 0);
    CGPoint endPos = CGPointMake(x, y);
    CGPathMoveToPoint(path, nil, startPos.x, startPos.y);
    CGPathAddLineToPoint(path, nil, endPos.x, endPos.y);
    SKAction *pathAction =  [SKAction followPath:path asOffset:YES orientToPath:NO speed:_player.speed];
    [_player runAction:pathAction withKey:key];
    CGPathRelease(path);
    NSLog(@"user.position1 = (%f,%f)",_player.position.x,_player.position.y);
}

- (void)userStopMove:(NSString *)key
{
    _startMove = NO;
    [_player removeActionForKey:key];
}

@end
