//
//  ViewController.swift
//  6COM1047_14146615
//
//  Created by Angel Wiseman on 30/12/2018.
//  Copyright © 2018 Angel Wiseman. All rights reserved.
//

import UIKit
import AVFoundation
protocol subviewDelegate {
    func changeSomething()
}


class ViewController: UIViewController, subviewDelegate {
    
    
    //physics prep
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    var enemyViewArray : [UIImageView] = []
    var rewardViewArray : [UIImageView] = []
    var dynamicAnimator2: UIDynamicAnimator!
    var dynamicItemBehavior2: UIDynamicItemBehavior!
    //sound
    var gameMusic: AVAudioPlayer?
    var playerView = UIImageView(image: nil)
    
    
    
    var timerArray = [0,1,1,3,4,5,6,6,7,8,8,9,10,12,12,13,15,15,15,16,18,20,20,20,22,23,24,25,25,25,25,26]
    var score = 0
    
    //Player car with Interface builder
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    //@IBOutlet weak var scoreDisplay: UILabel!
    
    @IBOutlet weak var scoreDisplay: UILabel!
    //@IBOutlet weak var playerImageView: IsDraggable!
    
    //@IBOutlet weak var playerImageView: IsDraggable!
    
    @IBOutlet weak var playerImage: IsDraggable!
    
    @IBOutlet weak var replayButton: UIButton!
    @IBAction func replayButton(_ sender: UIButton) {
        reset()
    }
    //@IBOutlet weak var replayButton: UIButton!
    //@IBAction func replayButton(_ sender: UIButton) {
    //    reset()
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("loading view")
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named: "princess-1.tiff")!,
                           UIImage(named: "princess-2.tiff")!,
                           UIImage(named: "princess-3.tiff")!,
                           UIImage(named: "princess-4.tiff")!,
                           UIImage(named: "princess-5.tiff")!,
                           UIImage(named: "princess-6.tiff")!,
                           UIImage(named: "princess-7.tiff")!,
                           UIImage(named: "princess-8.tiff")!,
                           UIImage(named: "princess-9.tiff")!,
                           UIImage(named: "princess-10.tiff")!,
                           UIImage(named: "princess-11.tiff")!,
                           UIImage(named: "princess-12.tiff")!,
                           UIImage(named: "princess-13.tiff")!,
                           UIImage(named: "princess-14.tiff")!,
                           UIImage(named: "princess-15.tiff")!,
                           UIImage(named: "princess-16.tiff")!]
        
        playerImage.image = UIImage.animatedImage(with: imageArray, duration: 1)
        makeSky()
        makeMountainFirst()
        makeMountain()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        dynamicItemBehavior = UIDynamicItemBehavior()
        collisionBehavior = UICollisionBehavior()
        //collisionBehavior.collisionDelegate = self
        makeEnemy()
        self.view.addSubview(playerImage)
        makeRewardObject()
        self.view.addSubview(playerImage)
        self.view.addSubview(scoreDisplay)
        self.view.bringSubviewToFront(scoreDisplay)
        //makePlayer()
        playerImage.myDelegate = self
        self.replayButton!.isHidden = true
        playGameNusic()
        
    }
    
    
    
    func changeSomething() {
        
        collisionBehavior.removeAllBoundaries()
        collisionBehavior.addBoundary(withIdentifier: "barrier" as
            NSCopying, for: UIBezierPath(rect: playerImage.frame))
        
        for i in enemyViewArray{
            
            if (i.frame.intersects(self.playerImage.frame) && self.score>0){
                print("collision")
                self.score = self.score-1
                print("score is ", self.score)
                updateScore()
            
            }
        }
            
        for i in rewardViewArray {
                
            if (i.frame.intersects(self.playerImage.frame) && self.score>0){
                print("collision")
                self.score = self.score+10
                print("score is ", self.score)
                updateScore()
                }
            }
        
    }
    
    
    func timeOut(){
        
        let gameOver: UIImage = UIImage(named: "princessbackgound.png")!
        let gameOverView: UIImageView = UIImageView(image: gameOver)
        self.view.addSubview(gameOverView)
        gameOverView.frame = UIScreen.main.bounds
        gameOverView.frame.origin.y = 0
        self.gameMusic?.stop()
        
        self.view.addSubview(replayButton)
        self.replayButton?.isHidden = false
        self.view.bringSubviewToFront(gameOverView)
        self.view.bringSubviewToFront(replayButton!)
        self.view.bringSubviewToFront(scoreDisplay)
    }
    
    func reset(){
        enemyViewArray = []
        rewardViewArray = []
        print("resetting")
        score = 0
        updateScore()
        viewDidLoad()
    }
    
    func updateScore(){
        scoreDisplay.text = "Score: " + String(self.score)
    }
    
    
    func makeMountain(){
        //load sky image
        let sky1: UIImage = UIImage(named: "snow-mountain.png")!
        let skyView: UIImageView = UIImageView(image: sky1)
        self.view.addSubview(skyView)
        skyView.frame = UIScreen.main.bounds
        skyView.frame.origin.x = 0
        
        //load sky2
        let sky2: UIImage = UIImage(named: "snow-mountain.png")!
        let skyView2: UIImageView = UIImageView(image: sky2)
        self.view.addSubview(skyView2)
        skyView2.frame = UIScreen.main.bounds
        skyView2.frame.origin.x = +skyView.frame.width
        
        
        
        
        //animate the sky
        UIView.animate(withDuration: 8, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView.center.x -= self.view.bounds.width
                
        }, completion: nil
        )
        
        //animate the sky 2
        UIView.animate(withDuration: 8, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView2.center.x -= self.view.bounds.width
                
        }, completion: nil
        )
    }
    
    func makeMountainFirst(){
        //load sky image
        let sky1: UIImage = UIImage(named: "snow-mountain2.png")!
        let skyView: UIImageView = UIImageView(image: sky1)
        self.view.addSubview(skyView)
        skyView.frame = UIScreen.main.bounds
        skyView.frame.origin.x = 0
        
        //load sky2
        let sky2: UIImage = UIImage(named: "snow-mountain2.png")!
        let skyView2: UIImageView = UIImageView(image: sky2)
        self.view.addSubview(skyView2)
        skyView2.frame = UIScreen.main.bounds
        skyView2.frame.origin.x = +skyView.frame.width
        
        
        
        
        //animate the sky
        UIView.animate(withDuration: 8.3, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView.center.x -= self.view.bounds.width
                
        }, completion: nil
        )
        
        //animate the sky 2
        UIView.animate(withDuration: 8.3, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView2.center.x -= self.view.bounds.width
                
        }, completion: nil
        )
    }
    
    func makeSky(){
        //load sky image
        let sky1: UIImage = UIImage(named: "cloud.png")!
        let skyView: UIImageView = UIImageView(image: sky1)
        self.view.addSubview(skyView)
        skyView.frame = UIScreen.main.bounds
        skyView.frame.origin.x = 0
        
        //load sky2
        let sky2: UIImage = UIImage(named: "cloud.png")!
        let skyView2: UIImageView = UIImageView(image: sky2)
        self.view.addSubview(skyView2)
        skyView2.frame = UIScreen.main.bounds
        skyView2.frame.origin.x = -skyView.frame.width
        
        
        
        
        //animate the sky
        UIView.animate(withDuration: 30, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView.center.x += self.view.bounds.width
                
        }, completion: nil
        )
        
        //animate the sky 2
        UIView.animate(withDuration: 30, delay: 0.0, options: [UIView.AnimationOptions.repeat, .curveLinear], animations:
            {
                skyView2.center.x += self.view.bounds.width
                
        }, completion: nil
        )
    }
    
    
    func addVelocity(object: UIImageView, speed: Int){
        dynamicAnimator2 = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior2 = UIDynamicItemBehavior(items: [object])
        dynamicItemBehavior2.addLinearVelocity(CGPoint(x:0, y:speed), for: object)
        dynamicItemBehavior2.addItem(object)
        dynamicAnimator2.addBehavior(self.dynamicItemBehavior2)
    }

    
    // creating an enemy object
    func makeEnemy(){
        for i in 0...20 {
            
            var numOfenemy: UInt32 = 5
            let randUInt = arc4random_uniform(numOfenemy)
            let speedMod = arc4random_uniform(numOfenemy)
            let random_height = CGFloat(arc4random_uniform(UInt32(self.H))) + 0;
            let randCGFloat: CGFloat = CGFloat(randUInt)
            let delay = Double(self.timerArray[i])
            let when = DispatchTime.now() + delay
            
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                let enemyView = UIImageView(image: nil)
                self.enemyViewArray.append(enemyView)
                
                self.enemyViewArray[i].frame = CGRect(x:self.W, y:random_height, width: 50, height: 50)
                self.view.addSubview(self.enemyViewArray[i])
                self.view.bringSubviewToFront(self.enemyViewArray[i])
                
                
                
                // random speeds
                var speed = 800
                
                switch speedMod {
                case 0: speed = 400
                case 1: speed = 1000
                case 2: speed = 1200
                default: speed = 800
                }
                
            
                
                
                //print("random number is", randUInt)
                //print("random speed is", speedMod)
                
                //linear velocity
                self.dynamicItemBehavior.addItem(enemyView)
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x:-speed, y:0), for: enemyView)
                self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                
                
                //collision
                self.collisionBehavior.removeAllBoundaries()
                self.collisionBehavior = UICollisionBehavior(items: self.enemyViewArray)
                self.dynamicAnimator.addBehavior(self.collisionBehavior)
                
                // choose images for cars
                switch randUInt {
                case 0:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                case 1:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                case 2:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                case 3:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                case 4:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                default:
                    self.enemyViewArray[i].image = UIImage(named: "bullet.png")
                    
                }
                
                
                self.score = self.score + 10
                self.updateScore()
                
                // the cars dont fall at precise intervals to a timer is set from 2 seconds after the last car drops
                if (i==20){
                    let timeOut = DispatchTime.now()+2
                    DispatchQueue.main.asyncAfter(deadline: timeOut){
                        self.timeOut()
                    }
                }
            }
        }
    }
    
    // creating a reward object
    func makeRewardObject(){
        for i in 0...20 {
            
            var numOfReward: UInt32 = 5
            let randUInt = arc4random_uniform(numOfReward)
            let speedMod = arc4random_uniform(numOfReward)
            let random_height = CGFloat(arc4random_uniform(UInt32(self.H))) + 0;
            let randCGFloat: CGFloat = CGFloat(randUInt)
            let delay = Double(self.timerArray[i])
            let when = DispatchTime.now() + delay
            
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                let rewardView = UIImageView(image: nil)
                self.rewardViewArray.append(rewardView)
                
                self.rewardViewArray[i].frame = CGRect(x:self.W, y:random_height, width: 30, height: 30)
                self.view.addSubview(self.rewardViewArray[i])
                self.view.bringSubviewToFront(self.rewardViewArray[i])
                
                
                var speed = 300
                
                switch speedMod {
                case 0: speed = 200
                case 1: speed = 1000
                case 2: speed = 500
                default: speed = 300
                }
                
                
                self.dynamicItemBehavior.addItem(rewardView)
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x:-speed, y:0), for: rewardView)
                self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                
                
                //collision
                self.collisionBehavior.removeAllBoundaries()
                self.collisionBehavior = UICollisionBehavior(items: self.rewardViewArray)
                self.dynamicAnimator.addBehavior(self.collisionBehavior)
                
                // choose images for objects
                switch randUInt {
                case 0:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                case 1:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                case 2:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                case 3:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                case 4:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                default:
                    self.rewardViewArray[i].image = UIImage(named: "coin.png")
                    
                }
                
                
                self.score = self.score + 10
                self.updateScore()
                
                // the objects dont fall at precise intervals to a timer is set from 2 seconds after the last object drops
                if (i==20){
                    let timeOut = DispatchTime.now()+2
                    DispatchQueue.main.asyncAfter(deadline: timeOut){
                        self.timeOut()
                    }
                }
            }
        }
    }
    
    func playGameNusic(){
        let path = Bundle.main.path(forResource: "gameMusic.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            gameMusic = try AVAudioPlayer(contentsOf: url)
            gameMusic?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


