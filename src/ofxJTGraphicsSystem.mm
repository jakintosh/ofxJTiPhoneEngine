//
//  ofxJTGraphicsSystem.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/16/13.
//
//

#include "ofxJTGraphicsSystem.h"

ofxJTGraphicsSystem::ofxJTGraphicsSystem(void)
{
	mGraphicsManager = nullptr;
	mParticleSystem  = nullptr;
}

ofxJTGraphicsSystem::~ofxJTGraphicsSystem(void)
{
	delete mGraphicsManager;
	delete mParticleSystem;
	
	mGraphicsManager = nullptr;
	mParticleSystem = nullptr;
}

void ofxJTGraphicsSystem::setup(void)
{
	mGraphicsManager = new ofxJTGraphicsManager();
	mParticleSystem = new ofxJTParticleSystem();
	
	mGraphicsManager->setup();
	mGraphicsManager->loadGraphics("");
	
	mParticleSystem->setup("", mGraphicsManager);
	
	mParticleSystem->addEffect("testEffect", ofPoint(160,240));
}

void ofxJTGraphicsSystem::update(double _gameTime)
{
	mParticleSystem->update(_gameTime);
	mGraphicsManager->update(_gameTime);
}

void ofxJTGraphicsSystem::draw(void)
{
	mGraphicsManager->draw();
	mParticleSystem->draw();
}
