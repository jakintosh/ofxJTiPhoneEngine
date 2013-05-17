//
//  ofxJTParticleEmitter.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#include "ofxJTParticleEmitter.h"

ofxJTParticleEmitter::ofxJTParticleEmitter(ofxJTParticleEffect _data, ofPoint _spawn, ofxJTGraphicsManager* _graphics)
{
	effectIsDead = false;
	
	mGraphics = _graphics;
	
	mPos = _spawn;
	
	mPoolSize  = _data.mPoolSize;
	mSpawnRate = _data.mSpawnRate;
	mNextSpawn = 0;
	mDuration  = _data.mDuration;
	mEffectAge = 0;
	
	mAnimData = _data.mAnimData;
	mParticleData = _data.mParticle;
	
	mParticleCount = 0;
	
	for (int i = 0; i < mPoolSize; i++)
	{
		mParticlePool.push_back(new ofxJTParticle(mParticleData->mLifespan, _graphics->addGraphic(mAnimData, ofPoint(-32,-32), ofPoint(16,16))));
	}
}

ofxJTParticleEmitter::~ofxJTParticleEmitter(void)
{
	for (int i = 0; i < mPoolSize; i++)
	{
		mGraphics->removeGraphic(mParticlePool.at(i)->getGraphic());
		delete mParticlePool.at(i);
	}
	mParticlePool.clear();
}

bool ofxJTParticleEmitter::update(float _gameTime)
{
	mEffectAge += _gameTime;
	mNextSpawn -= _gameTime;
	
	if(mEffectAge >= mDuration) {
		if(mParticleCount == 0) {
			effectIsDead = true;
			return false;  // if effect is over and all particles have resolved
		}
	}
	if (mNextSpawn <= 0) {
		spawnParticle();
		mNextSpawn = mSpawnRate;
	}
	
	for(int i = 0; i < mParticleCount; i++) {
		if (!mParticlePool.at(i)->update(_gameTime)) {  //  if particle is dead
			deadParticle(i);
			i--;
		}
	}
	cout<<mParticleCount<<endl;
	return true;
}

void ofxJTParticleEmitter::draw(void)
{
	for(int i = 0; i < mParticleCount; i++)
	{
		mParticlePool.at(i)->draw();
	}
}

void ofxJTParticleEmitter::spawnParticle(void)
{
	if(mEffectAge < mDuration && mParticleCount < mPoolSize)
	{
		ofPoint spawn = mPos;
		spawn.x += ((((float)(rand() % 100) * mParticleData->mSpawnVarience.x) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mSpawnVarience.x) / 100.0);
		spawn.y += ((((float)(rand() % 100) * mParticleData->mSpawnVarience.y) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mSpawnVarience.y) / 100.0);
		
		ofVec2f vel = mParticleData->mVel;
		vel.x += ((((float)(rand() % 100) * mParticleData->mVelocityVarience.x) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mVelocityVarience.x) / 100.0);
		vel.y += ((((float)(rand() % 100) * mParticleData->mVelocityVarience.y) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mVelocityVarience.y) / 100.0);
		
		float scale = mParticleData->mInitialScale;
		scale += ((((float)(rand() % 100) * mParticleData->mScaleVarience) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mScaleVarience) / 100.0);
		
		ofColor col = mParticleData->mInitialColor;
		col.r += ((((float)(rand() % 100) * mParticleData->mColorVarience.r) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mColorVarience.r) / 100.0);
		col.g += ((((float)(rand() % 100) * mParticleData->mColorVarience.g) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mColorVarience.g) / 100.0);
		col.b += ((((float)(rand() % 100) * mParticleData->mColorVarience.b) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mColorVarience.b) / 100.0);
		col.a += ((((float)(rand() % 100) * mParticleData->mColorVarience.a) / 100.0) * 2) - (((float)(rand() % 100) * mParticleData->mColorVarience.a) / 100.0);
		
		mParticlePool.at(mParticleCount)->init(spawn, vel, mParticleData->mAcc, scale, mParticleData->mFinalScale, col, mParticleData->mFinalColor);
		
		mParticleCount++;
	}
}

void ofxJTParticleEmitter::deadParticle(int _index)
{
	mParticlePool.at(_index)->reset();								//  wipe the dead particle
	ofxJTParticle* temp = mParticlePool.at(mParticleCount-1);		//  get the last living particle
	mParticlePool.at(mParticleCount-1) = mParticlePool.at(_index);	//  move the dead particle to the end
	mParticlePool.at(_index) = temp;								//  move living particle to the dead position
	mParticleCount--;												//  decrement the particle count
}
