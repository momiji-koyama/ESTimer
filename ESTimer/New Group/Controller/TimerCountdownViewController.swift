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
    func name() {
        switch self {
        case .standby:
            print("standby")
        case .starting:
            print("starting")
        case .pause:
            print("pause")
        case .finished:
            print("finished")
        }
    }
}

class TimerCountdownViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var timer : Timer = Timer()
    let startTime: Int = 5
    var currentTime: Int = 0
    var timerStatus: TimerStatus = .standby {
        didSet {
            switch self.timerStatus {
                case .standby:
                    self.rightButton.setTitle("スタート", for: .normal)
                    self.leftButton.setTitle("キャンセル", for: .normal)
                case .starting:
                    self.rightButton.setTitle("ストップ", for: .normal)
                    self.leftButton.setTitle("終了", for: .normal)
                case .pause:
                    self.rightButton.setTitle("再開", for: .normal)
                    self.leftButton.setTitle("終了", for: .normal)
                case .finished:
                    self.rightButton.isEnabled = false
                    self.leftButton.isEnabled = false
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaa")
        
        
    }
    @IBAction func leftButtonOnClicked(_ sender: Any) {
        self.timerStatus.name()
        switch self.timerStatus {
        case .standby:
            self.navigationController?.popViewController(animated: true)
        case .starting:
            self.timerStatus = .finished
        case .pause:
            self.timerStatus = .finished
        case .finished:
            break
        }
        self.timerStatus.name()
    }
    @IBAction func rightButtonOnClicked(_ sender: Any) {
        self.timerStatus.name()
        switch self.timerStatus {
        case .standby:
            self.currentTime = self.startTime
            self.startTimer()
            self.timerStatus = .starting
        case .starting:
            self.timer.invalidate()
            self.timerStatus = .pause
        case .pause:
            self.startTimer()
            self.timerStatus = .starting
        case .finished:
            break
        }
        self.timerStatus.name()
    }
    func startTimer(){
        
        
        self.timer.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        self.currentTime -= 1
        
        let hour = (self.currentTime/60) / 60
        let minute = (self.currentTime/60) % 60
        let second = self.currentTime % 60
        
        let sHour = String(format: "%02d", hour)
        let sMinute = String(format:"%02d", minute)
        let sSecond = String(format:"%02d", second)
        self.timerLabel.text = "\(sHour):\(sMinute):\(sSecond)"
    }
    
}
