//
//  ofxJTParticle.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#include "ofxJTParticle.h"

ofxJTParticle::ofxJTParticle(int _lifespan, ofxJTGraphic* _grphc)
{
	mLifespan = _lifespan;
	mGraphic = _grphc;
}

ofxJTParticle::~ofxJTParticle(void)
{
	mGraphic = nullptr;
}

void ofxJTParticle::init(ofVec2f _pos, ofVec2f _vel, ofVec2f _acc, float _initScale, float _finalScale, ofColor _initColor, ofColor _finalColor)
{
	mPos = _pos;
	mVel = _vel;
	mAcc = _acc;
	
	mScale = _initScale;
	mInitialScale = _initScale;
	mFinalScale = _finalScale;
	
	mColor = _initColor;
	mInitialColor = _initColor;
	mFinalColor = _finalColor;
	
	mAge = 0;
}

void ofxJTParticle::reset()
{
	mPos = ofPoint(0,0);
	mVel = ofPoint(0,0);
	mAcc = ofPoint(0,0);
	
	mScale = 0;
	mInitialScale = 0;
	mFinalScale = 0;
	
	mColor = ofColor(255, 255, 255, 255);
	mInitialColor = ofColor(255, 255, 255, 255);
	mFinalColor = ofColor(255, 255, 255, 255);
	
	mAge = 0;
	
	mGraphic->setPosition(mPos);
	mGraphic->setScale(mScale);
	mGraphic->setColor(mColor);
}

bool ofxJTParticle::update(float dt)
{
	mAge += dt;
	if (mAge >= mLifespan) return false;
	
	mVel.x += (float)(mAcc.x * (dt/1000.0));
	mVel.y += (float)(mAcc.y * (dt/1000.0));
	
	mPos.x += (float)(mVel.x * (dt/1000.0));
	mPos.y += (float)(mVel.y * (dt/1000.0));
	
	mColor = mInitialColor.lerp(mFinalColor, ((float)mAge/(float)mLifespan));
	
	mScale = mInitialScale + ((mFinalScale - mInitialScale) * ((float)mAge/(float)mLifespan));
	
	mGraphic->setPosition(mPos);
	mGraphic->setScale(mScale);
	mGraphic->setColor(mColor);
	
	return true;
}

void ofxJTParticle::draw()
{
	mGraphic->draw();
}
