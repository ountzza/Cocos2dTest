//
//  HelloWorldLayer.h
//  TestCocos
//
//  Created by Suwitcha Sugthana on 12/5/54 BE.
//  Copyright __MyCompanyName__ 2554. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *me;
    CCLabelTTF *label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
