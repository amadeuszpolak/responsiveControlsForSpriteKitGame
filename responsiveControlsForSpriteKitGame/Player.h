//
//  Player.h
//  responsiveControlsForSpriteKitGame
//
//  Created by Macbook on 26.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "HUDNode.h"
#import "HUDFireNode.h"

@interface Player : SKSpriteNode {
    
}

@property (nonatomic, weak) HUDNode *hud;
@property (nonatomic, weak) HUDFireNode *hudFire;

- (void)update:(NSTimeInterval)dt;

@end
