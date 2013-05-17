//
//  ofxJTSpriteSheet.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//	This is a simple spritesheet that will keep track of an ofImage
//	so that sprites can draw subsections to the screen. It acts as a
//  container for a single ofImage, with methods to load the texture,
//	and an accessor for sprites.
//


#ifndef __ofxJTiPhoneEngine__ofxJTSpriteSheet__
#define __ofxJTiPhoneEngine__ofxJTSpriteSheet__

#include "ofxiPhone.h"

class ofxJTSpriteSheet
{
    
public:
    
    ofxJTSpriteSheet(void);
	~ofxJTSpriteSheet(void);

	void loadImage(string _filename);
	ofImage* getSpriteSheet(void);

protected:

	ofImage* p_mSpriteSheet;

};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTSpriteSheet__) */
