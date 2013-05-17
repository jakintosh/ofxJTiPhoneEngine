//
//  ofxJTAnimation.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#include "ofxJTAnimation.h"

ofxJTAnimation::ofxJTAnimation(int _numFrames, int _msPerFrame, int _currentFrame, bool _looping, bool _animating)
{
	msUntilNextFrame = _msPerFrame;
	msPerFrame = _msPerFrame;
	currentFrame = _currentFrame;
	numFrames = _numFrames;
	
	mLooping = _looping;
	mAnimating = _animating;
}

ofxJTAnimation::~ofxJTAnimation(void)
{
}

void ofxJTAnimation::update(double _gameTime)
{
	if (mAnimating)
	{
		msUntilNextFrame -= _gameTime;
		
		if (msUntilNextFrame <= 0) {
			msUntilNextFrame = msPerFrame;
			currentFrame++;
			if(currentFrame >= numFrames) {
				if(!mLooping){
					currentFrame = numFrames - 1;
					mAnimating = false;
					return;
				}
				currentFrame = 0;
			}
		}
	}
}

void ofxJTAnimation::draw(float _x, float _y)
{
	mSprites.at(currentFrame)->draw(_x, _y);
}

void ofxJTAnimation::addSprite(ofxJTSprite* _sprite)
{
	mSprites.push_back(_sprite);
}

void ofxJTAnimation::addSprites(vector<ofxJTSprite*> _sprites)
{
	for (int i = 0; i < _sprites.size(); i++)
	{
		mSprites.push_back(_sprites.at(i));
	}
}

void ofxJTAnimation::setAnimating(bool _animating)
{
	mAnimating = _animating;
}

void ofxJTAnimation::setLooping(bool _looping)
{
	mLooping = _looping;
}
