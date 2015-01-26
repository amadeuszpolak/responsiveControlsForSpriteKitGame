//
//  HudNode.h
//  responsiveControlsForSpriteKitGame
//
//  Created by Macbook on 26.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

@import SpriteKit;

typedef NS_ENUM(NSInteger, JoyDirection) {
    JoyNone,
    JoyLeft,
    JoyRight
};

@interface HUDNode : SKNode

@property (nonatomic, assign) JoyDirection joyDirection;

@property (nonatomic, strong) SKSpriteNode *leftButton;
@property (nonatomic, strong) SKSpriteNode *rightButton;

@property (nonatomic, strong) NSArray *buttons;

@property (nonatomic, assign) BOOL leftButtonPressed;
@property (nonatomic, assign) BOOL rightButtonPressed;

@property (nonatomic, assign) CGSize sceneSize;

- (instancetype)initWithSize:(CGSize)size;

@end
