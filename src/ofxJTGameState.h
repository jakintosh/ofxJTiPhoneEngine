//
//  GameState.h
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/10/13.
//
//

#ifndef __ofxJTiPhoneEngine__ofxJTGameState__
#define __ofxJTiPhoneEngine__ofxJTGameState__

class ofxJTGameState
{
    
public:
    virtual void init() = 0;
    virtual void cleanup() = 0;
    
    virtual void pause() = 0;
    virtual void resume() = 0;
    
    virtual void update(double _gameTime) = 0;
    virtual void draw() = 0;
    
};

#endif /* defined(__ofxJTiPhoneEngine__ofxJTGameState__) */
