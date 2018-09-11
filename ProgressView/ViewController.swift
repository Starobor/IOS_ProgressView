//
//  ViewController.swift
//  ProgressView
//
//  Created by Citizen on 11.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

   private var progressView = UIProgressView()
   private var button = UIButton()
   private var newTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createProgress(progressView)
        createButton(button)
        createTimer()
    }
    
    private func createTimer() {
        newTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.1
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.button.alpha = 1
                self.button.setTitle("Start", for: .normal)
                self.newTimer.invalidate()
            }
        }
    }

    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x-(150/2), y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.black
        progressView.trackTintColor = UIColor.gray
        self.view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height-100, width: 150, height: 70)
        button.setTitle("Button", for: .normal)
        button.backgroundColor = UIColor.blue
        button.alpha = 0.2
        self.view.addSubview(button)
    }
    

}

