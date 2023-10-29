//
//  timerSegmentViewController.swift
//  StopwatchNeobis
//
//  Created by Burte Bayaraa on 2023.10.23.
//

import UIKit

class timerSegmentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var totalSeconds = 0
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.dataSource = self
        timePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func updateTimerLabel() {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = (totalSeconds % 60) % 60
        
        timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    //PickerVIEW
     @objc func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 3 // Number of components in the picker view
    }
    
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if component == 0{
            return 24 //hours: 0-23
        }
        else {
            return 60 //min and sec: 0-59
        }
    }
    
    @objc func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    @objc func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hours = pickerView.selectedRow(inComponent: 0)
        let minutes = pickerView.selectedRow(inComponent: 1)
        let seconds = pickerView.selectedRow(inComponent: 2)
 
        totalSeconds = hours * 3600 + minutes * 60 + seconds
        updateTimerLabel()
        }
    
    @objc func updateTimer() {      //for the the time tracking         //for the selector
        if totalSeconds > 0 {       //continue decreasing the total time left
            totalSeconds -= 1
            updateTimerLabel()
        } else {        //the time ran out
            timer.invalidate()
            isTimerRunning = false
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            stopButton.isEnabled = false
        }
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        timer.invalidate()  //no need to track the timre since stop is pressed->reset everything
        isTimerRunning = false
        totalSeconds = 0
        updateTimerLabel()
        startButton.isEnabled = true    //only need start (reset)
        pauseButton.isEnabled = false
        stopButton.isEnabled = false
    }
    
    
    @IBAction func pauseAction(_ sender: UIButton) {
        if isTimerRunning{
            timer.invalidate()
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            stopButton.isEnabled = true
        }
        
        
    }
    
    
    @IBAction func playAction(_ sender: UIButton) {
        if (!isTimerRunning){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)     //slecter has to be an objc
        isTimerRunning = true
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        stopButton.isEnabled = true
        }
    }
}
