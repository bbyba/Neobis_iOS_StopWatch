//
//  stopwatchSegmentViewController.swift
//  StopwatchNeobis
//
//  Created by Burte Bayaraa on 2023.10.27.
//

import UIKit

class stopwatchSegmentViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var totalSeconds = 0
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeLabel() //update the initial time label
    }
    
    @objc func updateStopwatch(){
//        if totalSeconds == 0   don't need the if loop cuz we have to increment in any situation in a stopwatch
        totalSeconds += 1
        updateTimeLabel()
    }
    
    func updateTimeLabel(){
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        timeLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    
    @IBAction func stopAction(_ sender: UIButton) {
        if isTimerRunning{
            timer.invalidate()
            //reset the time label after pressing or else it will be a pause button
            totalSeconds = 0
            updateTimeLabel()
            startButton.isEnabled = true    //only need start (reset)
            pauseButton.isEnabled = false
            stopButton.isEnabled = false
        }
    }
    
    
    @IBAction func pauseAction(_ sender: UIButton) {
        if isTimerRunning{
            timer.invalidate()
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            stopButton.isEnabled = true
        }
    }
    
    
    @IBAction func startAction(_ sender: UIButton) {
        if (!isTimerRunning){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
            isTimerRunning = true
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            stopButton.isEnabled = true
        }
    }
    
    
    
}
