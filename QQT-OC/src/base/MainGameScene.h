//
//  MainGameScene.h
//  QQT-OC
//
//  Created by 一只皮卡丘 on 2017/1/13.
//  Copyright © 2017年 一只皮卡丘. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

@interface MainGameScene : SKScene
{
    
}

@property (nonatomic) NSMutableArray<GKEntity *> *entities;
@property (nonatomic) NSMutableDictionary<NSString*, GKGraph *> *graphs;

@end
