//
//Pomodoro Timer
//

import UIKit

class ViewController: UIViewController {
    var pomodoroClass = pomodoro()
    var timer: Timer?
    
    @IBAction func start(_ sender: AnyObject) {
        if pomodoroClass.pomoMode == 0 {
            timer?.invalidate()
            timer = nil
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.pomoing(_:)), userInfo: nil, repeats: true)
        }
        pomodoroClass.start()
        print("Start")
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        print("Stop")
        pomodoroClass.stop()
        timer?.invalidate()
        timer = nil
        process.progress = 0
        updateStatus()
    }
    
    @IBAction func continuousTime(_ sender: UISwitch) {
        if sender.isOn {
            pomodoroClass.longBreakEnable = true
        } else {
            pomodoroClass.longBreakEnable = false
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var process: UIProgressView!
    
    func pomoing(_ timer:Timer) {
        process.progress = pomodoroClass.process / 100
        timeLabel.text = pomodoroClass.timerLabel
        updateStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        pomodoroClass.pomoTime = 1500
//        pomodoroClass.breakTime = 500
//        pomodoroClass.longBreakTime = 1500
//        pomodoroClass.longBreakCount = 4
        

//        pomodoroClass.isDebug = false
        
        timeLabel.text = pomodoroClass.timerLabel
    }
    
    func updateStatus() {
        switch pomodoroClass.pomoMode {
        case 0:
            statusLabel.text = "Complete"
        case 1:
            statusLabel.text = "Working..."
        case 2:
            statusLabel.text = "Tea Break"
        case 3:
            statusLabel.text = "Long Break"
        default:break
        }
    }
}

