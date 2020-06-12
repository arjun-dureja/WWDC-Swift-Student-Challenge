/*:
 
 # WWDC 2020 Swfit Student Challenge Submission - Arjun Dureja
 
 Hello,
 
    My name is Arjun Dureja and this is my submission for the Swift Student Challenge.
    I have created a Playground to educate people about algorithms, more specifically, sorting algorithms
    Anyone can learn from this Playground, from kids starting to code, to anyone who wants to get into computer
    science.
    I hope you enjoy viewing my Playground and maybe learn something from it :)
 
 Thank you,
 Arjun
 
 Note: I own the chart image used in this Playground

*/

import UIKit
import PlaygroundSupport

//Create view with navigation controller
let viewRect = CGRect(x: 0, y: 0, width: 900, height: 600)
let vc = InitialViewController()
let nc = UINavigationController(rootViewController: vc)
nc.navigationBar.isHidden = true
nc.view.frame = viewRect
PlaygroundPage.current.liveView = nc.view
