//
//  ViewController.swift
//  StopwatchNeobis
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var timerSegmentView: UIView!
    
    @IBOutlet weak var stopwatchSegmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(timerSegmentView)
        self.view.bringSubviewToFront(stopwatchSegmentView)
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        //switch
        switch sender.selectedSegmentIndex{
        case 0:
            self.view.bringSubviewToFront(timerSegmentView)
        case 1:
            self.view.bringSubviewToFront(stopwatchSegmentView)
        default:
            break
        }
    }
    
}

 
