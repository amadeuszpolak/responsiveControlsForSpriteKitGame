//
//  Player.m
//  responsiveControlsForSpriteKitGame
//
//  Created by Macbook on 26.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "Player.h"
#import "GameScene.h"

@interface Player ()

@end

@implementation Player

- (id)initWithImageNamed:(NSString *)name {
    if (self = [super initWithImageNamed:name]) {
        
    }
    return self;
}

- (void)update:(NSTimeInterval)dt {
    
        if (self.hud.joyDirection == JoyLeft)
        {
            self.position = CGPointMake(self.position.x-1, self.position.y);
        }
        else if (self.hud.joyDirection == JoyRight)
        {
            self.position = CGPointMake(self.position.x+1, self.position.y);
        }
        else if (self.hud.joyDirection == JoyNone)
        {
            self.position = CGPointMake(self.position.x, self.position.y);
        }
}

@end
