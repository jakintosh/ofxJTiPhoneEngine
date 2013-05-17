//
//  ofxJTGraphic.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#include "ofxJTGraphic.h"

ofxJTGraphic::ofxJTGraphic(ofPoint _pos, ofxJTAnimation* _anim, ofPoint _ref)
{
	mPosition = _pos;
	
	mNextDrawX = mPosition.x;
	mNextDrawY = mPosition.y;
	
	mReferencePoint = _ref;
	mRotation = 0;
	mScaleX = 1;
	mScaleY = 1;
	mColor = ofColor(255, 255, 255, 255);
	
	//  graphics need thier own copies of animations
	mAnimation = new ofxJTAnimation(_anim->numFrames, _anim->msPerFrame, 0, _anim->mLooping, _anim->mAnimating);
	mAnimation->addSprites(_anim->mSprites);
}

ofxJTGraphic::~ofxJTGraphic(void)
{
	delete mAnimation;
	mAnimation = nullptr;
}

void ofxJTGraphic::update(double _gameTime)
{
	mAnimation->update(_gameTime);
	
	//  now do math to find draw location after all transforms
	mNextDrawX = mPosition.x;
	mNextDrawY = mPosition.y;
	
	//  if rotation is 0, just skip this, it saves time
	if (mRotation != 0)
	{
		mRotated = true;
		
		//  just keeps the rotation between 0 and 360
		while (mRotation > 360) {
			mRotation -= 360;
		} while (mRotation < 0) {
			mRotation += 360;
		}
		
		//  get the original angle the object was at, set to 0 for 0,0 to avoid nan error
		float originalAngle;
		if (mPosition.x == 0 && mPosition.y == 0) originalAngle = 0;
		else originalAngle = atan(mPosition.y/mPosition.x);
		
		//  get the length of the hypotenuse
		float hypotenuse = sqrt((mPosition.x * mPosition.x) + (mPosition.y * mPosition.y));
		
		//  get the x and y coords of the end of the rotated hypotenuse
		mNextDrawX = cos(ofDegToRad(-ofAngleDifferenceDegrees(ofRadToDeg(originalAngle), mRotation))) * hypotenuse;
		mNextDrawY = sin(ofDegToRad(-ofAngleDifferenceDegrees(ofRadToDeg(originalAngle), mRotation))) * hypotenuse;
	} else mRotated = false;
	
	if(mColor == ofColor(255,255,255,255)) mColored = false;
	else mColored = true;
	
	if(mScaleX == 1.0 && mScaleY == 1.0) mScaled = false;
	else mScaled = true;
	
	//  this adjust coordinates for scaling
	mNextDrawX /= mScaleX;
	mNextDrawY /= mScaleY;
	
	//  finally, subtract the offset
	mNextDrawX -= mReferencePoint.x;
	mNextDrawY -= mReferencePoint.y;
	
}

void ofxJTGraphic::draw(void)
{
	ofPushMatrix();
	
	if(mRotated) ofRotate(mRotation, 0, 0, 1);
	if(mScaled)  ofScale(mScaleX, mScaleY);
	if(mColored) ofSetColor(mColor);
	
	mAnimation->draw(mNextDrawX, mNextDrawY);
	
	ofPopMatrix();
}

void ofxJTGraphic::setPosition(ofPoint _pos)
{
	mPosition = _pos;
}

void ofxJTGraphic::setReferencePoint(ofPoint _ref)
{
	mReferencePoint = _ref;
}

void ofxJTGraphic::setRotation(float _rot)
{
	mRotation = _rot;
}

void ofxJTGraphic::setScale(float _scale)
{
	mScaleX = _scale;
	mScaleY = _scale;
}

void ofxJTGraphic::setScale(float _scaleX, float _scaleY)
{
	mScaleX = _scaleX;
	mScaleY = _scaleY;
}

void ofxJTGraphic::setColor(int r, int g, int b, int a)
{
	mColor.set(r, g, b, a);
}

void ofxJTGraphic::setColor(ofColor _color)
{
	mColor = _color;
}
