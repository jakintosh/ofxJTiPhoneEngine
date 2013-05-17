//
//  ofxJTParticleSystem.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#include "ofxJTParticleSystem.h"

ofxJTParticleSystem::ofxJTParticleSystem(void)
{
	mEffectUID = 0;
	
	ofxJTParticleData* testParticle = new ofxJTParticleData();
	
	testParticle->mLifespan = 750;
	
	testParticle->mVel = ofVec2f(0, -300);
	testParticle->mAcc = ofVec2f(0, 100);
	
	testParticle->mInitialScale = 1;
	testParticle->mFinalScale = 2;
	
	testParticle->mInitialColor = ofColor(255, 255, 255, 255);
	testParticle->mFinalColor = ofColor(0, 0, 0, 0);
	
	testParticle->mColorVarience = ofColor(0, 0, 0, 0);
	testParticle->mSpawnVarience = ofVec2f(5,5);
	testParticle->mVelocityVarience = ofVec2f(100, 5);
	testParticle->mScaleVarience = 0.2;
	
	//mParticleTypes["test"] = testParticle;
	mParticleTypes.insert(pair<string, ofxJTParticleData*>("test", testParticle));
	
	ofxJTParticleEffect* testEffect = new ofxJTParticleEffect();
	
	testEffect->mAnimData = 0;
	testEffect->mDuration = 10000;
	testEffect->mSpawnRate = 50;
	testEffect->mPoolSize = 15;
	testEffect->mParticle = mParticleTypes.find("test")->second;
	
	//mEffectTypes["testEffect"] = testEffect;
	mEffectTypes.insert(pair<string, ofxJTParticleEffect*>("testEffect", testEffect));
}

ofxJTParticleSystem::~ofxJTParticleSystem(void)
{
}

void ofxJTParticleSystem::setup(string _filename, ofxJTGraphicsManager* _graphics)
{
	mGraphics = _graphics;
}

void ofxJTParticleSystem::update(double _gameTime)
{
	map<int,ofxJTParticleEmitter*>::iterator iter;
	
	int deadEffects = 0;
	
	for (iter = mActiveEffects.begin(); iter != mActiveEffects.end(); iter++)
	{
		if(!iter->second->update(_gameTime)) deadEffects++;
	}
	
	while (deadEffects > 0)
	{
		for (iter = mActiveEffects.begin(); iter != mActiveEffects.end(); iter++)
		{
			if(iter->second->isDead())
			{
				delete iter->second;
				mActiveEffects.erase(iter);
				deadEffects--;
				break;
			}
		}
	}
}

void ofxJTParticleSystem::draw(void)
{
	map<int,ofxJTParticleEmitter*>::iterator iter;
	
	for (iter = mActiveEffects.begin(); iter != mActiveEffects.end(); iter++)
	{
		iter->second->draw();
	}
}

void ofxJTParticleSystem::addEffect(string _type, ofPoint _pos)
{
	//  create new ofxJTParticleEffect with the type and position given
	mActiveEffects[mEffectUID] = new ofxJTParticleEmitter(*mEffectTypes.find("testEffect")->second, _pos, mGraphics);
}
