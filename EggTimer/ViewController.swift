//
//  ViewController.swift
//  EggTimer
//  Justin DeMartinis


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 4, "Medium": 240, "Hard": 420]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?

    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        

        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        

        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        
    }
    
   @objc func updateTimer() {
    
        if(secondsPassed < totalTime) {
          
            secondsPassed = secondsPassed + 1

            progressBar.progress = Float(secondsPassed) / Float(totalTime)

        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
            
            playSound(soundName: "alarm_sound")
            
        }
    }
    
    func playSound(soundName:String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
                
    }
    
   
}
