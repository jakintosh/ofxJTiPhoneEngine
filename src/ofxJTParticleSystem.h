//
//  ofxJTParticleSystem.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTParticleSystem__
#define __ofxJTiPhoneEngine__ofxJTParticleSystem__

#include <map>

#include "ofxiPhone.h"
#include "ofxJTParticleEmitter.h"

class ofxJTGraphicsManager;

class ofxJTParticleSystem
{
	
public:
	
	ofxJTParticleSystem(void);
	~ofxJTParticleSystem(void);
	
	void setup(string _filename, ofxJTGraphicsManager* _graphics);
	void update(double _gameTime);
	void draw(void);
	
	void addEffect(string _type, ofPoint _pos);
	
protected:
	
	int mEffectUID;
	
	ofxJTGraphicsManager*					mGraphics;
	map<string,ofxJTParticleData*>			mParticleTypes;
	map<string,ofxJTParticleEffect*>		mEffectTypes;
	map<int,ofxJTParticleEmitter*>			mActiveEffects;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTParticleSystem__) */
