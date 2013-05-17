//
//  ofxJTGraphicsManager.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/13/13.
//
//

#include "ofxJTGraphicsManager.h"

ofxJTGraphicsManager::ofxJTGraphicsManager(void)
{
	mGraphicUID = 0;
}

ofxJTGraphicsManager::~ofxJTGraphicsManager(void)
{
	removeAll();
}

void ofxJTGraphicsManager::setup(void)
{
	// setup code
}

void ofxJTGraphicsManager::cleanup(void)
{
	removeAll();
}

void ofxJTGraphicsManager::loadGraphics(string filename)
{
	//  ------------------ temporary ----------------------
	
	// sheets
	mSpriteSheets[0] = new ofxJTSpriteSheet();
	mSpriteSheets.find(0)->second->loadImage("player.png");
	
	// sprites
	for (int i = 0; i < 16; i++)
	{
		ofxJTSprite* temp = new ofxJTSprite(ofRectangle( (i%4)*32, (i/4)*32, 32, 32), mSpriteSheets.find(0)->second);
		//mSprites[i] = temp;
		mSprites.insert(pair<int,ofxJTSprite*>(i, temp));
	}
	
	// animations
	for	(int i = 0; i < 4; i++)
	{
		ofxJTAnimation* temp = new ofxJTAnimation(4, 75);
		temp->addSprite(mSprites.find((i*4)+0)->second);
		temp->addSprite(mSprites.find((i*4)+1)->second);
		temp->addSprite(mSprites.find((i*4)+2)->second);
		temp->addSprite(mSprites.find((i*4)+3)->second);
		//mAnimations[i] = temp;
		mAnimations.insert(pair<int,ofxJTAnimation*>(i, temp));
	}

	// ----------------------------------------------------
}

void ofxJTGraphicsManager::update(double _gameTime)
{	
	map<int,ofxJTGraphic*>::iterator giter;
	for (giter = mGraphics.begin(); giter != mGraphics.end(); giter++)
	{
		giter->second->update(_gameTime);
	}
}

void ofxJTGraphicsManager::draw(void)
{	
	map<int,ofxJTGraphic*>::iterator giter;
	for (giter = mGraphics.begin(); giter != mGraphics.end(); giter++)
	{
		giter->second->draw();
	}
}

ofxJTGraphic* ofxJTGraphicsManager::addGraphic(int _animID, ofPoint _pos, ofPoint _ref)
{
	ofxJTGraphic* returnGraphic = nullptr;
	
	map<int,ofxJTAnimation*>::iterator iter = mAnimations.find(_animID);
	
	if (iter != mAnimations.end())
	{
		returnGraphic = new ofxJTGraphic(_pos, mAnimations.find(_animID)->second, _ref);
		//mGraphics[mGraphicUID] = returnGraphic;
		mGraphics.insert(pair<int,ofxJTGraphic*>(mGraphicUID,returnGraphic));
		mGraphicUID++;
	}
	
	else cout << "GFX_MGR: Could not initialize graphic <" << mGraphicUID << "> because animation <" << _animID << "> could not be found." << endl;
	
	return returnGraphic;
}

void ofxJTGraphicsManager::removeGraphic(ofxJTGraphic* _graphic)
{
	map<int,ofxJTGraphic*>::iterator iter;
	
	for(iter = mGraphics.begin(); iter!= mGraphics.end(); iter++)
	{
		if (iter->second == _graphic)
		{
			delete iter->second;
			mGraphics.erase(iter);
			break;
		}
	}
}

void ofxJTGraphicsManager::removeGraphic(int _key)
{
	map<int,ofxJTGraphic*>::iterator iter = mGraphics.find(_key);
	
	if (iter != mGraphics.end())
	{
		delete iter->second;
		mGraphics.erase(iter);
	}
}

void ofxJTGraphicsManager::removeAll()
{
	map<int,ofxJTSpriteSheet*>::iterator ssiter;
	for (ssiter = mSpriteSheets.begin(); ssiter != mSpriteSheets.end(); ssiter++)
	{
		delete ssiter->second;
		mSpriteSheets.erase(ssiter->first);
	}
	mSpriteSheets.clear();
	
	map<int,ofxJTSprite*>::iterator siter;
	for (siter = mSprites.begin(); siter != mSprites.end(); siter++)
	{
		delete siter->second;
		mSprites.erase(siter->first);
	}
	mSprites.clear();
	
	map<int,ofxJTAnimation*>::iterator aiter;
	for (aiter = mAnimations.begin(); aiter != mAnimations.end(); aiter++)
	{
		delete aiter->second;
		mAnimations.erase(aiter->first);
	}
	mAnimations.clear();
	
	map<int,ofxJTGraphic*>::iterator giter;
	for (giter = mGraphics.begin(); giter != mGraphics.end(); giter++)
	{
		delete giter->second;
		mGraphics.erase(giter->first);
	}
	mGraphics.clear();
}