//
//  Game.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/10/13.
//
//

#ifndef __ofxJTiPhoneEngine__Game__
#define __ofxJTiPhoneEngine__Game__

#include "ofxiPhone.h"
#include "ofxJTGameState.h"
#include "ofxJTGameTime.h"
#include "ofxJTGraphicsSystem.h"

//----------components needed-----------
// class GraphicsSystem;
//     primitives
//     particle system
//--------------------------------------

class ofxJTGame : public ofxiPhoneApp
{
    
public:
    
    void setup();
    void update();
    void draw();
    void exit();
	
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
    void changeState(void);
    void pushState(void);
    void popState(void);
    
private:
	
	ofxJTGameTime*			gameTime;
	ofxJTGraphicsSystem*	graphicsSystem;
    vector<ofxJTGameState*> gameStates;
    
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGame__) */
