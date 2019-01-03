//
//  IsDraggable.swift
//  6COM1047_14146615
//
//  Created by Angel Wiseman on 30/12/2018.
//  Copyright © 2018 Angel Wiseman. All rights reserved.
//

import UIKit

class IsDraggable: UIImageView {
    
    var startLocation: CGPoint?
    var myDelegate : subviewDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        startLocation = touches.first?.location(in: self)
        self.myDelegate?.changeSomething()
        print("touching")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        let newCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        self.center = newCenter
        
        // print("player car moving")
        self.myDelegate?.changeSomething()
        print("moving")
        
    }
    
}
