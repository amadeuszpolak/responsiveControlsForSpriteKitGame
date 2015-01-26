//
//  HudNode.m
//  responsiveControlsForSpriteKitGame
//
//  Created by Macbook on 26.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "GameScene.h"
#import "SharedTextureCache.h"

#import "HUDNode.h"

@interface HUDNode ()

@end

@implementation HUDNode

- (instancetype)initWithSize:(CGSize)size {
    if ((self = [super init])) {
        self.userInteractionEnabled = YES;
        self.sceneSize = size;
        
        self.leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"arrow_left"];
        self.leftButton.position = CGPointMake(self.leftButton.size.width/2+10, 40);
        [self addChild:self.leftButton];
        
        self.rightButton = [SKSpriteNode spriteNodeWithImageNamed:@"arrow_right"];
        self.rightButton.position = CGPointMake(self.leftButton.position.x+self.rightButton.size.width+10, 40);
        [self addChild:self.rightButton];
        
        self.buttons = @[self.leftButton, self.rightButton];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        
        for (SKSpriteNode *button in self.buttons) {
            if (CGRectContainsPoint(button.frame, touchLocation)) {
                if (button == self.rightButton)
                {
                    [self sendDirection:JoyRight];
                }
                else if (button == self.leftButton)
                {
                    [self sendDirection:JoyLeft];
                }
            }
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        
        for (SKSpriteNode *button in self.buttons) {
            if (CGRectContainsPoint(button.frame, touchLocation))
            {
                [self sendDirection:JoyNone];
            }
        }
        if (touchLocation.x<240) {       //half of a screen size
            self.rightButtonPressed = NO;
            self.leftButtonPressed = NO;
            self.joyDirection = JoyNone;
            [self.rightButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_right"]];
            [self.leftButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_left"]];
        }
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        CGPoint previousTouchLocation = [touch previousLocationInNode:self];
        
        for (SKSpriteNode *button in self.buttons) {
            if (CGRectContainsPoint(button.frame, previousTouchLocation) &&
                !CGRectContainsPoint(button.frame, touchLocation))
            {
                [self sendDirection:JoyNone];
            }
        }
        
        for (SKSpriteNode *button in self.buttons) {
            if (!CGRectContainsPoint(button.frame, previousTouchLocation) &&
                CGRectContainsPoint(button.frame, touchLocation)) {
                if (button == self.rightButton)
                {
                    [self sendDirection:JoyRight];
                }
                else if (button == self.leftButton)
                {
                    [self sendDirection:JoyLeft];
                }
            }
        }
    }
}


- (void)sendDirection:(JoyDirection)direction {
    if (direction == JoyLeft)
    {
        self.leftButtonPressed = YES;
        self.rightButtonPressed = NO;
        [self.leftButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_left_taped"]];
        [self.rightButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_right"]];
    }
    else if (direction == JoyRight)
    {
        self.rightButtonPressed = YES;
        self.leftButtonPressed = NO;
        [self.rightButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_right_taped"]];
        [self.leftButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_left"]];
    }
    else {
        self.rightButtonPressed = NO;
        self.leftButtonPressed = NO;
        [self.rightButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_right"]];
        [self.leftButton setTexture:[[SharedTextureCache sharedCache] textureNamed:@"arrow_left"]];
    }
}

#pragma mark - Properties


- (JoyDirection)joyDirection {
    if (self.leftButtonPressed) {
        return JoyLeft;
    } else if (self.rightButtonPressed) {
        return JoyRight;
    }
    return JoyNone;
}

@end
