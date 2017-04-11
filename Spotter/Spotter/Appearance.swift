//
//  Appearance.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/11/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//  Credit to Bob Seitsinger from CS378 iOS

import UIKit

// UIAppearance is a protocol which UIKit components conform to that allows properties
// to be set at runtime for all instances of a class. For example, defining the background
// color that all UILabels (or custom classes derived from UILabel) will use.
//
// To use it, simply call the appearance() method of a UIView (which all UI element classes
// derive from) which conforms to the protocol. This gets you a proxy object which you can
// use to make style changes on and they will automagically be applied to all instances of
// that class in your app.

class Appearance {
    
    class func setInitialAppTheme() {
        Appearance.setMyCustomCellColor()
        Appearance.setMyCustomNavBarColor()
    }
    
    class func setMyCustomCellColor() {
        ExerciseHeaderTableViewCell.appearance().backgroundColor = Config.customTableHeaderCellColor
    }
    
    class func setMyCustomNavBarColor() {
        UINavigationBar.appearance().backgroundColor = Config.customNavBarColor
        UINavigationBar.appearance().tintColor = Config.customNavBarColor
        UINavigationBar.appearance().barTintColor = Config.customNavBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    class func updateCellColor(color: UIColor) {
        Config.customTableHeaderCellColor = color
        Appearance.setMyCustomCellColor()
    }
    
    class func updateNavBarColor(color: UIColor) {
        Config.customNavBarColor = color
        Appearance.setMyCustomNavBarColor()
    }
}
