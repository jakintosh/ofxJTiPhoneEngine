//
//  ofxJTSprite.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTSprite__
#define __ofxJTiPhoneEngine__ofxJTSprite__

#include "ofxiPhone.h"
#include "ofxJTSpriteSheet.h"

class ofxJTSprite
{

public:
	
	ofxJTSprite(void);
	ofxJTSprite(ofRectangle _size, ofxJTSpriteSheet* _sheet);
	~ofxJTSprite(void);
	
	void draw(float _x, float _y);
	
	void setSize(ofRectangle _size);
	void setSize(float _x, float _y, float _w, float _h);
	void setSheet(ofxJTSpriteSheet* _sheet);
	
protected:
	
	ofRectangle mSize;
	ofxJTSpriteSheet* mSheet;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTSprite__) */
