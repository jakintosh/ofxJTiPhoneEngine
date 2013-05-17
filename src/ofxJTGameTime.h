//
//  ofxJTGameTime.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/11/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTGameTime__
#define __ofxJTiPhoneEngine__ofxJTGameTime__

#include <iostream>

class ofxJTGameTime
{
	
public:
	
	ofxJTGameTime(unsigned long long _ofTime);
	~ofxJTGameTime(void);
	
	double GetElapsedMilliseconds(void);
	double GetElapsedSeconds(void);
	double GetTotalMilliseconds(void);
	double GetTotalSeconds(void);

	void update(unsigned long long _ofTime);
	
private:
	
	unsigned long long mTotalMilliseconds;
	unsigned long long mElapsedMilliseconds;
	unsigned long long mTimeAtLastUpdate;
	
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGameTime__) */
