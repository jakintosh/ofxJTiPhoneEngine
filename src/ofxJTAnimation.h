//
//  ofxJTAnimation.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTAnimation__
#define __ofxJTiPhoneEngine__ofxJTAnimation__

#include "ofxJTSprite.h"

class ofxJTAnimation
{
	friend class ofxJTGraphic; // so it can grab a copy
	
public:
	
	ofxJTAnimation(int _numFrames = 1, int _msPerFrame = 50, int _currentFrame = 0, bool _looping = true, bool _animating = true);
	~ofxJTAnimation(void);
	
	void update(double _gameTime);
	void draw(float _x, float _y);
	
	void addSprite(ofxJTSprite* _sprite);
	void addSprites(vector<ofxJTSprite*> _sprites);
	
	void setAnimating(bool _animating);
	void setLooping(bool _looping);
	
protected:
	
	//  animation vars
	double msUntilNextFrame;
	int msPerFrame;
	int currentFrame;
	int numFrames;
	
	//  sprite list
	vector<ofxJTSprite*> mSprites;
	
	//  settings
	bool mLooping;
	bool mAnimating;
	
};


#endif /* defined(__ofxJTiPhoneEngine__ofxJTAnimation__) */
