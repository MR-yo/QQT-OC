//
//  ViewController.m
//  QQT-OC
//
//  Created by 一只皮卡丘 on 2017/1/13.
//  Copyright © 2017年 一只皮卡丘. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"
#import "MainGameScene.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
//    // including entities and graphs.
//    GKScene *scene = [GKScene sceneWithFileNamed:@"GameScene"];
//    
//    // Get the SKScene from the loaded GKScene
//    GameScene *sceneNode = (GameScene *)scene.rootNode;
//    
//    // Copy gameplay related content over to the scene
//    sceneNode.entities = [scene.entities mutableCopy];
//    sceneNode.graphs = [scene.graphs mutableCopy];
//    
//    // Set the scale mode to scale to fit the window
//    sceneNode.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene
//    [self.skView presentScene:sceneNode];
//
//    self.skView.showsFPS = YES;
//    self.skView.showsNodeCount = YES;
    
    [self loadMainView];
    
}

- (void)loadMainView
{
    GKScene *scene = [GKScene sceneWithFileNamed:@"MainGameScene"];
    MainGameScene *sceneNode = (MainGameScene *)scene.rootNode;
    sceneNode.entities = [scene.entities mutableCopy];
    sceneNode.graphs = [scene.graphs mutableCopy];
    sceneNode.scaleMode = SKSceneScaleModeAspectFill;
    [self.skView presentScene:sceneNode];
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;

}

@end
