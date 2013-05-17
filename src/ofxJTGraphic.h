//
//  ofxJTGraphic.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTGraphic__
#define __ofxJTiPhoneEngine__ofxJTGraphic__

#include "ofxiPhone.h"
#include "ofMath.h"
#include "ofxJTAnimation.h"

class ofxJTGraphic
{

public:
	
	ofxJTGraphic(ofPoint _pos, ofxJTAnimation* _anim, ofPoint _ref = ofPoint(0,0));
	~ofxJTGraphic(void);
	
	void update(double _gameTime);
	void draw(void);
	
	void setPosition(ofPoint _pos);
	void setReferencePoint(ofPoint _ref);
    void setRotation(float _rot);
	void setScale(float _scale);
	void setScale(float _scaleX, float _scaleY);
	void setColor(int r, int g, int b, int a);
	void setColor(ofColor _color);
	
protected:
	
	float mNextDrawX;
	float mNextDrawY;
	
	ofPoint mPosition;				//  screen coordinates
	ofPoint mReferencePoint;		//  local coordinates
    float mRotation;
	float mScaleX;
	float mScaleY;
	ofColor mColor;
	
	// optimization(?) variables
	bool mRotated;
	bool mColored;
	bool mScaled;
	
	ofxJTAnimation* mAnimation;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGraphic__) */
