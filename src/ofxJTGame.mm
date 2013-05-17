//
//  Game.cpp
//  ofxJTiPhoneEngine
//
//  Created by Jak Tiano on 5/10/13.
//
//

#include "ofxJTGame.h"

// ---------------------- Open Frameworks ----------------------

void ofxJTGame::setup(){

	ofxAccelerometer.setup();
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	ofBackground(127,127,127);
	ofSetFrameRate(60);
	
	//  set up the gameTime
	gameTime = new ofxJTGameTime(ofGetElapsedTimeMillis());
	
	// set up graphics
	graphicsSystem = new ofxJTGraphicsSystem();
	graphicsSystem->setup();
	
}

void ofxJTGame::update(){
    
	//  always update gameTime first, it needs to know what the time is at the beginning of the loop
	gameTime->update(ofGetElapsedTimeMillis());
//    gameStates.back()->update(gameTime->GetElapsedMilliseconds());
	graphicsSystem->update(gameTime->GetElapsedMilliseconds());
	
}

void ofxJTGame::draw(){
	
//    gameStates.back()->draw();
	graphicsSystem->draw();
	
	//cout << ofGetFrameRate() << endl;
}

void ofxJTGame::exit(){
    
}

void ofxJTGame::touchDown(ofTouchEventArgs & touch){
	
}

void ofxJTGame::touchMoved(ofTouchEventArgs & touch){
    
}

void ofxJTGame::touchUp(ofTouchEventArgs & touch){
	
}

void ofxJTGame::touchDoubleTap(ofTouchEventArgs & touch){
    
}

void ofxJTGame::touchCancelled(ofTouchEventArgs & touch){
    
}

void ofxJTGame::lostFocus(){
    
}

void ofxJTGame::gotFocus(){
    
}

void ofxJTGame::gotMemoryWarning(){
    
}

void ofxJTGame::deviceOrientationChanged(int newOrientation){
    
}

// ---------------------- State Management ----------------------

void ofxJTGame::changeState(void){
    
}

void ofxJTGame::pushState(void){
    
}

void ofxJTGame::popState(void){
    
}

