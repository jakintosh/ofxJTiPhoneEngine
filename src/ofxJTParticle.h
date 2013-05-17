//
//  ofxJTParticle.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTParticle__
#define __ofxJTiPhoneEngine__ofxJTParticle__

#include "ofMain.h"
#include "ofxJTGraphic.h"

typedef struct {
	
	int mLifespan;
	
	ofVec2f mVel;
	ofVec2f mAcc;
	
	float mInitialScale;
	float mFinalScale;
	
	ofColor mInitialColor;
	ofColor mFinalColor;
	
	ofColor mColorVarience;
	ofVec2f mSpawnVarience;
	ofVec2f	mVelocityVarience;
	float mScaleVarience;
	
} ofxJTParticleData;

class ofxJTParticle
{
	
	friend class ofxJTParticleEmitter;
	
public:
	
	ofxJTParticle(int _lifespan, ofxJTGraphic* _grphc);
	~ofxJTParticle(void);
	
	void init(ofVec2f _pos, ofVec2f _vel, ofVec2f _acc, float _initScale, float _finalScale, ofColor _initColor, ofColor _finalColor);
	void reset();
	
	bool update(float _dt);
	void draw();
	
protected:
	
	ofxJTGraphic* getGraphic(void) {return mGraphic;};
	
	ofVec2f mPos;
	ofVec2f mVel;
	ofVec2f mAcc;
	
	float mScale;
	float mInitialScale;
	float mFinalScale;
	
	ofColor mColor;
	ofColor mInitialColor;
	ofColor mFinalColor;
	
	int mAge;
	int mLifespan;
	
	ofxJTGraphic* mGraphic;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTParticle__) */
