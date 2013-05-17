//
//  ofxJTGraphicsSystem.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/16/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTGraphicsSystem__
#define __ofxJTiPhoneEngine__ofxJTGraphicsSystem__

#include "ofxJTGraphicsManager.h"
#include "ofxJTParticleSystem.h"

class ofxJTGraphicsSystem
{

public:
	
	ofxJTGraphicsSystem(void);
	~ofxJTGraphicsSystem(void);
	
	void setup(void);
	void update(double _gameTime);
	void draw(void);
	
protected:
	
	ofxJTGraphicsManager* mGraphicsManager;
	ofxJTParticleSystem*  mParticleSystem;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGraphicsSystem__) */
