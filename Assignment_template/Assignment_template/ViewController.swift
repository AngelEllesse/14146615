//
//  ViewController.swift
//  Assignment_template
//
//  Created by aw15abo on 05/11/2018.
//  Copyright © 2018 CSStestuser. All rights reserved.
//

import UIKit

protocol subviewdelegate{
    func changeSomething()
}

class ViewController: UIViewController, subviewdelegate {

    
    
    @IBOutlet weak var road: UIImageView!
    
    @IBOutlet weak var tree: UIImageView!
    
    @IBOutlet weak var cloud: UIImageView!

    @IBOutlet weak var cloud2: UIImageView!
    
    @IBOutlet weak var plane: dragged_image!
    
    var birdDynamicAnimator: UIDynamicAnimator!
    var birdViewDynamicBehavior: UIDynamicItemBehavior!
    
    var birdDynamicAnimator1: UIDynamicAnimator!
    var birdViewDynamicBehavior1: UIDynamicItemBehavior!
    
    var collisionBehaviour: UICollisionBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicBehaviour: UIDynamicItemBehavior!
    
    let delayArray = [0, 3, 6, 9, 12, 15, 18, 21, 25, 28]
    var delayviewArray: [UIImageView] = []

    
    let delayArray1 = [1, 4, 9, 12, 16, 21, 25, 29, 32, 35]
    var delayviewArray1: [UIImageView] = []

    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    func changeSomething() {
        collisionBehaviour.removeAllBoundaries()
        collisionBehaviour.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: plane.frame))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var imageArrayRoad: [UIImage]!
        
        imageArrayRoad = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!]
        
        road.image = UIImage.animatedImage(with: imageArrayRoad, duration: 1)
        self.road.frame.size.width = W
        self.road.frame.size.height = H
        
        
        var imageArrayTree: [UIImage]!
        
        imageArrayTree = [UIImage(named: "tree1.png")!,
                          UIImage(named: "tree2.png")!,
                          UIImage(named: "tree3.png")!,
                          UIImage(named: "tree4.png")!,
                          UIImage(named: "tree5.png")!,
                          UIImage(named: "tree6.png")!,
                          UIImage(named: "tree7.png")!,
                          UIImage(named: "tree8.png")!,
                          UIImage(named: "tree9.png")!,
                          UIImage(named: "tree10.png")!,
                          UIImage(named: "tree11.png")!,
                          UIImage(named: "tree12.png")!,
                          UIImage(named: "tree13.png")!,
                          UIImage(named: "tree14.png")!,
                          UIImage(named: "tree15.png")!,
                          UIImage(named: "tree16.png")!,
                          UIImage(named: "tree17.png")!]
        
        tree.image = UIImage.animatedImage(with: imageArrayTree, duration: 3)
        
        self.tree.frame.size.width = W
       // self.tree.frame.size.height = H * -1.1
        
        
        var imageArrayPlane: [UIImage]!
        
        imageArrayPlane = [UIImage(named: "plane1.png")!,
                          UIImage(named: "plane2.png")!,
                          UIImage(named: "plane3.png")!,
                          UIImage(named: "plane4.png")!,
                          UIImage(named: "plane5.png")!,
                          UIImage(named: "plane6.png")!,
                          UIImage(named: "plane7.png")!,
                          UIImage(named: "plane8.png")!,
                          UIImage(named: "plane9.png")!,
                          UIImage(named: "plane10.png")!,
                          UIImage(named: "plane11.png")!,
                          UIImage(named: "plane12.png")!,
                          UIImage(named: "plane13.png")!,
                          UIImage(named: "plane14.png")!,
                          UIImage(named: "plane15.png")!]
        
        plane.image = UIImage.animatedImage(with: imageArrayPlane, duration: 1)
        

        
        UIView.animate(withDuration: 40, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.cloud.center.x += self.view.bounds.width
                self.cloud2.center.x += self.view.bounds.width
                
            }, completion: nil
            
            //plane.mydelegate = self
            
        )
        
        for index in 0...9 {
            //let random_delay = Int(arc4random_uniform(3)) + 0
            let delay = Double(self.delayArray[index])
    
            let when = DispatchTime.now() + delay
    
            let random_speed = Int(arc4random_uniform(240)) + 235;
    
    
            DispatchQueue.main.asyncAfter(deadline: when) {
                let random_height = CGFloat(arc4random_uniform(UInt32(self.H))) + 0;
                let birdView = UIImageView(image: nil)
                    var imageArrayBird: [UIImage]!
    
                    imageArrayBird = [UIImage(named: "bird1.png")!,
                                      UIImage(named: "bird2.png")!,
                                      UIImage(named: "bird3.png")!,
                                      UIImage(named: "bird4.png")!,
                                      UIImage(named: "bird5.png")!,
                                      UIImage(named: "bird6.png")!,
                                      UIImage(named: "bird7.png")!,
                                      UIImage(named: "bird8.png")!,
                                      UIImage(named: "bird9.png")!,
                                      UIImage(named: "bird10.png")!]
    
                    birdView.image = UIImage.animatedImage(with: imageArrayBird, duration: 1)

  
                birdView.frame = CGRect(x: self.W, y: random_height, width: 50, height: 50)
                self.view.addSubview(birdView)
                self.delayviewArray.append(birdView)
   
                            //this is entialising the dynamic animator
                self.birdDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                self.birdViewDynamicBehavior = UIDynamicItemBehavior(items: [])
                self.birdDynamicAnimator.addBehavior(self.birdViewDynamicBehavior)
   
   
                self.birdViewDynamicBehavior.addItem(birdView)
    
                self.birdViewDynamicBehavior.addLinearVelocity(CGPoint(x: -random_speed, y: 0), for: birdView)
                
                
                self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                self.gravityBehaviour = UIGravityBehavior (items: [birdView])
                self.dynamicAnimator.addBehavior(self.gravityBehaviour)
                
                self.collisionBehaviour = UICollisionBehavior (items: [birdView])
                self.dynamicAnimator.addBehavior(self.collisionBehaviour)
                self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
                self.collisionBehaviour.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: self.plane.frame))
                self.dynamicBehaviour = UIDynamicItemBehavior (items: [birdView])
                self.dynamicBehaviour.elasticity = 0.8
                self.dynamicAnimator.addBehavior(self.dynamicBehaviour)
            
            }
        }
        
        
        for index in 0...9 {
            //let random_delay = Int(arc4random_uniform(3)) + 0
            let delay = Double(self.delayArray1[index])
            
            let when = DispatchTime.now() + delay
            
            let random_speed = Int(arc4random_uniform(240)) + 235;
            
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                let random_height = CGFloat(arc4random_uniform(UInt32(self.H))) + 0;
                let birdView = UIImageView(image: nil)
                var imageArrayBird: [UIImage]!
                
                imageArrayBird = [UIImage(named: "bird1.png")!,
                                  UIImage(named: "bird2.png")!,
                                  UIImage(named: "bird3.png")!,
                                  UIImage(named: "bird4.png")!,
                                  UIImage(named: "bird5.png")!,
                                  UIImage(named: "bird6.png")!,
                                  UIImage(named: "bird7.png")!,
                                  UIImage(named: "bird8.png")!,
                                  UIImage(named: "bird9.png")!,
                                  UIImage(named: "bird10.png")!]
                
                birdView.image = UIImage.animatedImage(with: imageArrayBird, duration: 1)
                
                
                //birdView.frame = CGRect(x: self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: 50, height: 50)
                birdView.frame = CGRect(x: self.W, y: random_height, width: 50, height: 50)
                self.view.addSubview(birdView)
                self.delayviewArray1.append(birdView)
                
                //this is entialising the dynamic animator
                self.birdDynamicAnimator1 = UIDynamicAnimator(referenceView: self.view)
                self.birdViewDynamicBehavior1 = UIDynamicItemBehavior(items: [])
                self.birdDynamicAnimator1.addBehavior(self.birdViewDynamicBehavior1)
                
                
                
            
                
                self.birdViewDynamicBehavior1.addItem(birdView)
                
                self.birdViewDynamicBehavior1.addLinearVelocity(CGPoint(x: -random_speed, y: 0), for: birdView)
                
            }
   
            
        }
    
    
    }
    

        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

