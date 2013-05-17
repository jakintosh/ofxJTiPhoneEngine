//
//  ofxJTGraphicsManager.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTGraphicsManager__
#define __ofxJTiPhoneEngine__ofxJTGraphicsManager__

#include <map>
#include "ofxiPhone.h"
#include "ofxJTSpriteSheet.h"
#include "ofxJTSprite.h"
#include "ofxJTAnimation.h"
#include "ofxJTGraphic.h"

class ofxJTParticleSystem;

class ofxJTGraphicsManager
{
	
public:
	
	ofxJTGraphicsManager(void);
	~ofxJTGraphicsManager(void);
	
	void setup(void);
	void cleanup(void);
	
	void loadGraphics(string filename);
	void update(double _gameTime);
	void draw(void);
	
	ofxJTGraphic* addGraphic(int _animID, ofPoint _pos = ofPoint(0,0), ofPoint _ref = ofPoint(0,0));
	void removeGraphic(ofxJTGraphic* _graphic);
	void removeGraphic(int _key);
	
protected:
	
	void removeAll(void);
	
	int mGraphicUID;
	int counter;
	
	map<int,ofxJTSpriteSheet*>	mSpriteSheets;
	map<int,ofxJTAnimation*>	mAnimations;
	map<int,ofxJTSprite*>		mSprites;
	map<int,ofxJTGraphic*>		mGraphics;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGraphicsManager__) */
