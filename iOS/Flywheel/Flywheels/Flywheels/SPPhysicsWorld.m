//
//  SPPhysicsWorld.m
//  Flywheels
//
//  Created by Rexford St. John on 6/19/12.
//  Copyright (c) 2012 Scanplay Games. All rights reserved.
//

#import "SPPhysicsWorld.h"
#import "b2World.h"
#import "b2Body.h"
#import "b2PolygonShape.h"
#import "b2Vec2.h"

@implementation SPPhysicsWorld

#define GRAVITY = -10f;
#define DO_SLEEP = true;

@synthesize world = _world;

-(id)init
{    
    if(self = [super init])
    {
        // Define the gravity vector.
        b2Vec2 gravity;
        gravity.Set(0.0f, GRAVITY);
        
        // Do we want to let bodies sleep?
        // This will speed up the physics simulation
        bool doSleep = DO_SLEEP;
        
        // Construct a world object, which will hold and simulate the rigid bodies.
        _world = new b2World(gravity, doSleep);        
        _world->SetContinuousPhysics(true);
        
        // Debug Draw functions
        m_debugDraw = new GLESDebugDraw( PTM_RATIO );
        world->SetDebugDraw(m_debugDraw);
        
        uint32 flags = 0;
        flags += b2DebugDraw::e_shapeBit;
        //		flags += b2DebugDraw::e_jointBit;
        //		flags += b2DebugDraw::e_aabbBit;
        //		flags += b2DebugDraw::e_pairBit;
        //		flags += b2DebugDraw::e_centerOfMassBit;
        m_debugDraw->SetFlags(flags);		
        
        
        // Define the ground body.
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0, 0); // bottom-left corner
        
        // Call the body factory which allocates memory for the ground body
        // from a pool and creates the ground box shape (also from a pool).
        // The body is also added to the world.
        b2Body* groundBody = world->CreateBody(&groundBodyDef);
        
        // Define the ground box shape.
        b2PolygonShape groundBox;		
        
        // bottom
        groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(screenSize.width/PTM_RATIO,0));
        groundBody->CreateFixture(&groundBox,0);
        
        // top
        groundBox.SetAsEdge(b2Vec2(0,screenSize.height/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO));
        groundBody->CreateFixture(&groundBox,0);
        
        // left
        groundBox.SetAsEdge(b2Vec2(0,screenSize.height/PTM_RATIO), b2Vec2(0,0));
        groundBody->CreateFixture(&groundBox,0);
        
        // right
        groundBox.SetAsEdge(b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,0));
        groundBody->CreateFixture(&groundBox,0);
    }
    
    return self;
}

@end