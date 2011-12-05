//
//  HelloWorldLayer.m
//  TestCocos
//
//  Created by Suwitcha Sugthana on 12/5/54 BE.
//  Copyright __MyCompanyName__ 2554. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    me.position = ccp(location.x, location.y+80);
   
    [me runAction:[CCScaleTo actionWithDuration:.25 scale:1.2]];
    [label runAction:[CCRotateTo actionWithDuration:.35 angle:180]];
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [me runAction:[CCScaleTo actionWithDuration:.25 scale:0.8]];
    [label runAction:[CCRotateTo actionWithDuration:.35 angle:0]];
}
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    me.position = ccp(location.x, location.y+80);
}
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
   // 
    /*
    label.position = ccp(label.position.x+acceleration.x, label.position.y+acceleration.y);
     */
}
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        // ask director the the window size
        
        self.isAccelerometerEnabled = YES;
        self.isTouchEnabled = YES;
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"bg2.png"];
        bg.anchorPoint = ccp(0,0);
        [self addChild:bg];
        
		// create and initialize a Label
		label = [CCLabelTTF labelWithString:@"Pondd World" fontName:@"Marker Felt" fontSize:40];


	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 - 90 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        
        me = [CCSprite spriteWithFile:@"Pondd.png"];
        me.position = ccp(size.width/2,size.height/2+20);
        [self addChild:me];
        

	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
