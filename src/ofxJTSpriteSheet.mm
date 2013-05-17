//
//  ofxJTSpriteSheet.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#include "ofxJTSpriteSheet.h"

ofxJTSpriteSheet::ofxJTSpriteSheet(void)
{
	p_mSpriteSheet = new ofImage();
}

ofxJTSpriteSheet::~ofxJTSpriteSheet(void)
{
	delete p_mSpriteSheet;
	p_mSpriteSheet = nullptr;
}

void ofxJTSpriteSheet::loadImage(string _filename)
{
	p_mSpriteSheet->loadImage(_filename);
}

ofImage* ofxJTSpriteSheet::getSpriteSheet(void)
{
	return p_mSpriteSheet;
}
