//
//  ofxJTParticleEmitter.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTParticleEmitter__
#define __ofxJTiPhoneEngine__ofxJTParticleEmitter__

#include "ofxJTGraphicsManager.h"
#include "ofxJTParticle.h"

typedef struct {
	
	int mPoolSize;
	int mDuration;
	int mSpawnRate;
	ofxJTParticleData* mParticle;
	
	int mAnimData;
	
} ofxJTParticleEffect;

class ofxJTParticleEmitter
{
	
public:
	
	ofxJTParticleEmitter(ofxJTParticleEffect _data, ofPoint _spawn, ofxJTGraphicsManager* _graphics);
	~ofxJTParticleEmitter(void);
	
	bool isDead(void) {return effectIsDead;};
	
	bool update(float _gameTime);
	void draw(void);
	
protected:
	
	void spawnParticle(void);
	void deadParticle(int _index);
	
	ofxJTGraphicsManager* mGraphics;
	bool effectIsDead;
	
	vector<ofxJTParticle*> mParticlePool;
	int mParticleCount;
	
	ofPoint mPos;
	int mPoolSize;
	int mSpawnRate;
	int mNextSpawn;
	int mDuration;
	int mEffectAge;
	int mAnimData;
	
	ofxJTParticleData* mParticleData;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTParticleEmitter__) */
