//
//  GameScene.m
//  responsiveControlsForSpriteKitGame
//
//  Created by Macbook on 26.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "HUDFireNode.h"
#import "HUDNode.h"
#import "Player.h"

#import "GameScene.h"

@interface GameScene ()

@property (nonatomic, strong) HUDNode *hud;
@property (nonatomic, strong) Player *player;
//@property (nonatomic, strong) HUDFireNode *hudFire;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    self.player = [[Player alloc] initWithImageNamed:@"point.png"];
    self.player.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild:self.player];
    
    /*self.hudFire = [[HUDFireNode alloc] initWithSize:self.size];
    [self addChild:self.hudFire];
    self.hudFire.zPosition = 100;
    self.player.hudFire = self.hudFire;*/
    
    self.hud = [[HUDNode alloc] initWithSize:self.size];
    [self addChild:self.hud];
    self.player.hud = self.hud;
}

-(void)update:(NSTimeInterval)currentTime {
    [self.player update:currentTime];
}

@end
