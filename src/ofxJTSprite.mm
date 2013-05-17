//
//  ofxJTSprite.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#include "ofxJTSprite.h"

ofxJTSprite::ofxJTSprite(void)
{
	mSheet = nullptr;
}

ofxJTSprite::ofxJTSprite(ofRectangle _size, ofxJTSpriteSheet* _sheet)
{
	mSize = _size;
	mSheet = _sheet;
}

ofxJTSprite::~ofxJTSprite(void)
{
	mSheet = nullptr;
}

void ofxJTSprite::draw(float _x, float _y)
{
	mSheet->getSpriteSheet()->drawSubsection(_x, _y, mSize.width, mSize.height, mSize.x, mSize.y);
}

void ofxJTSprite::setSize(ofRectangle _size)
{
	mSize = _size;
}

void ofxJTSprite::setSize(float _x, float _y, float _w, float _h)
{
	mSize.set(_x, _y, _w, _h);
}

void ofxJTSprite::setSheet(ofxJTSpriteSheet* _sheet)
{
	mSheet = _sheet;
}