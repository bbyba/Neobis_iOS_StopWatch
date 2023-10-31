//
//  ViewController.swift
//  StopwatchNeobis
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerImage: UIImageView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var stopwatchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(timerView)
        self.view.bringSubviewToFront(stopwatchView)
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 1:
            self.view.bringSubviewToFront(stopwatchView)
        default:
            self.view.bringSubviewToFront(timerView)
        }
    }
}

