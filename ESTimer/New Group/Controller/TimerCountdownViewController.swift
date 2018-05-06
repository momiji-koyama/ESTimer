//
//  TimerCountdownViewController.swift
//  ESTimer
//
//  Created by 小山萌美路 on 2018/05/06.
//  Copyright © 2018年 MMZ. All rights reserved.
//

import UIKit

enum TimerStatus: Int {
    case standby
    case starting
    case pause
    case finished
}

class TimerCountdownViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var timer : Timer = Timer()
    let startTime: Int = 5
    var currentTime: Int = 0
    var timerStatus: TimerStatus = .standby
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaa")
        self.rightButton.setTitle("開始", for: .normal)
        self.leftButton.setTitle("キャンセル", for: .normal)
        
        
    }
    @IBAction func leftButtonOnClicked(_ sender: Any) {
        switch self.timerStatus {
        case .standby:
            print("standby")
            self.navigationController?.popViewController(animated: true)
        case .starting:
            print("starting")
        case .pause:
            print("pause")
        case .finished:
            print("finished")
        }
    }
    @IBAction func rightButtonOnClicked(_ sender: Any) {
        switch self.timerStatus {
        case .standby:
            print("standby")
            self.startTimer()
        case .starting:
            print("starting")
            self.timer.invalidate()
        case .pause:
            print("pause")
        case .finished:
            print("finished")
        }
    }
    func startTimer(){
        
        self.rightButton.setTitle("一時停止", for: .normal)
        self.leftButton.setTitle("終了", for: .normal)
        self.currentTime = self.startTime
        self.timer.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        self.timerStatus = .starting
    }
    @objc func updateTimer(){
        self.currentTime -= 1
        self.timerLabel.text = "\(self.currentTime)"
    }
    
}
