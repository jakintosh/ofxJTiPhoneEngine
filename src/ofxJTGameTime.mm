//
//  ofxJTGameTime.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#include "ofxJTGameTime.h"

ofxJTGameTime::ofxJTGameTime(unsigned long long _ofTime)
{
	mTotalMilliseconds = _ofTime;
	mTimeAtLastUpdate = _ofTime;
	mElapsedMilliseconds = 0;
}

ofxJTGameTime::~ofxJTGameTime(void)
{
}

double ofxJTGameTime::GetElapsedMilliseconds(void)
{
	return (double)mElapsedMilliseconds;
}

double ofxJTGameTime::GetElapsedSeconds(void)
{
	return (double)(mElapsedMilliseconds/1000.0);
}

double ofxJTGameTime::GetTotalMilliseconds(void)
{
	return (double)mTotalMilliseconds;
}

double ofxJTGameTime::GetTotalSeconds(void)
{
	return (double)(mTotalMilliseconds/1000.0);
}

void ofxJTGameTime::update(unsigned long long _ofTime)
{
	mTimeAtLastUpdate = mTotalMilliseconds;
	mTotalMilliseconds = _ofTime;
	mElapsedMilliseconds = mTotalMilliseconds - mTimeAtLastUpdate;
}
