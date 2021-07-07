//
//  ViewController.swift
//  TapIt
//
//  Created by DCS on 06/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var timeleft = 30
    var score = 0
    var name:String = ""
    private var timer = Timer()
    
    private let grid1:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 20, y: 130, width: 120, height: 120)
        
        return view
    }()
    
    private let grid2:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 150, y: 130, width: 120, height: 120)
        return view
    }()
    
    private let grid3:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 280, y: 130, width: 120, height: 120)
        return view
    }()
    
    private let grid4:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 20, y: 260, width: 120, height: 120)
        return view
    }()
    
    private let grid5:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 150, y: 260, width: 120, height: 120)
        return view
    }()
    
    private let grid6:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 280, y: 260, width: 120, height: 120)
        return view
    }()
    
    private let grid7:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 20, y: 390, width: 120, height: 120)
        return view
    }()
    
    private let grid8:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 150, y: 390, width: 120, height: 120)
        return view
    }()
    
    private let grid9:UIView = {
        let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor =  UIColor.black.cgColor
        view.layer.cornerRadius = 20
        view.frame = CGRect(x: 280, y: 390, width: 120, height: 120)
        return view
    }()
    
    
    private let timerlabel : UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 90, y: 550, width: 80, height: 50)
        return label
    }()
    
    private let MyImageView: UIImageView = {
        
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.image = UIImage(named: "Clock")
        myImageView.frame = CGRect(x: 40, y: 555, width: 40, height: 40)
        return myImageView
        
    }()
    
    
    
    private let score_lbl : UILabel = {
        let score = UILabel()
        score.text = "Score:  "
        score.textColor = .black
        score.textAlignment = .center
        score.shadowColor = .darkGray
        score.font = .boldSystemFont(ofSize: 20)
        score.frame = CGRect(x: 180, y: 550, width: 80, height: 50)
        return score
    }()
    
    
    
    @objc private let Score : UILabel = {
        let sc = UILabel()
        sc.text = "0"
        sc.textColor = .black
        sc.textAlignment = .center
        sc.shadowColor = .darkGray
        sc.font = .boldSystemFont(ofSize: 20)
        sc.frame = CGRect(x: 270, y: 550, width: 80, height: 50)
        return sc
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(1)
        button.addTarget(self, action: #selector(starttimer), for: .touchUpInside)
        button.frame = CGRect(x: 40, y: 700, width: 330, height: 60)
        button.layer.cornerRadius = 32
        return button
    }()
    private let leaderboard : UIButton = {
        let strt = UIButton()
        strt.setTitle("Scoreboard", for: .normal)
        strt.addTarget(self, action: #selector(lead), for: .touchUpInside)
        strt.backgroundColor = .black
        strt.setTitleColor(.white, for: .normal)
        strt.layer.cornerRadius = 25
        strt.frame = CGRect(x: 130, y: 800, width: 120, height: 60)
        return strt
    } ()
    
    
    @objc private func lead(){
        let ld = LeaderboardVC()
        navigationController?.pushViewController(ld, animated: true)
    }
    
    @objc private func starttimer()
    {
        
        myButton.isHidden = true
        //  myTextView.isHidden = true
        score_lbl.isHidden = false
        Score.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Timerstart), userInfo: .none, repeats: true)
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("run")
        title = "TapMe"
        self.view.backgroundColor = .white
        view.addSubview(grid1)
        view.addSubview(grid2)
        view.addSubview(grid3)
        view.addSubview(grid4)
        view.addSubview(grid5)
        view.addSubview(grid6)
        view.addSubview(grid7)
        view.addSubview(grid8)
        view.addSubview(grid9)
        view.addSubview(timerlabel)
        view.addSubview(MyImageView)
        view.addSubview(score_lbl)
        view.addSubview(Score)
        view.addSubview(myButton)
        
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didtapgrid1))
        tapgesture.numberOfTapsRequired = 1
        tapgesture.numberOfTouchesRequired = 1
        
        let tapgesture2 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid2))
        tapgesture2.numberOfTapsRequired = 1
        tapgesture2.numberOfTouchesRequired = 1
        
        let tapgesture3 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid3))
        tapgesture3.numberOfTapsRequired = 1
        tapgesture3.numberOfTouchesRequired = 1
        
        let tapgesture4 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid4))
        tapgesture4.numberOfTapsRequired = 1
        tapgesture4.numberOfTouchesRequired = 1
        
        let tapgesture5 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid5))
        tapgesture5.numberOfTapsRequired = 1
        tapgesture5.numberOfTouchesRequired = 1
        
        let tapgesture6 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid6))
        tapgesture6.numberOfTapsRequired = 1
        tapgesture6.numberOfTouchesRequired = 1
        
        let tapgesture7 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid7))
        tapgesture7.numberOfTapsRequired = 1
        tapgesture7.numberOfTouchesRequired = 1
        
        let tapgesture8 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid8))
        tapgesture8.numberOfTapsRequired = 1
        tapgesture8.numberOfTouchesRequired = 1
        
        let tapgesture9 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid9))
        tapgesture9.numberOfTapsRequired = 1
        tapgesture9.numberOfTouchesRequired = 1
        
        
        grid1.addGestureRecognizer(tapgesture)
        grid2.addGestureRecognizer(tapgesture2)
        grid3.addGestureRecognizer(tapgesture3)
        grid4.addGestureRecognizer(tapgesture4)
        grid5.addGestureRecognizer(tapgesture5)
        grid6.addGestureRecognizer(tapgesture6)
        grid7.addGestureRecognizer(tapgesture7)
        grid8.addGestureRecognizer(tapgesture8)
        grid9.addGestureRecognizer(tapgesture9)
        
        
    }
    
}

extension ViewController{
    
    @objc private func didtapgrid1(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid1.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    
    @objc private func didtapgrid2(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid2.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid3(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid3.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    @objc private func didtapgrid4(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid4.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid5(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid5.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid6(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid6.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid7(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid7.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid8(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid8.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    @objc private func didtapgrid9(_ gesture:UITapGestureRecognizer, _ sender:UIView){
        print("Tapped at Location : \(gesture.location(in: sender))")
        if(self.grid9.backgroundColor!.isEqual(UIColor.black))
        {
            self.score += 10
            Score.text = String(score)
        }
        else{
            self.score -= 5
            Score.text = String(score)
        }
        
    }
    
    
    
    
    @objc private func Timerstart(){
        self.timeleft -= 1
        self.timerlabel.text = String(self.timeleft)
        let randomInt = Int.random(in: 1..<10)
        if( randomInt == 1)
        {
            grid1.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
            
        }
        else if(randomInt == 2)
        {
            grid2.backgroundColor = .black
            grid1.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 3)
        {
            grid3.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 4)
        {
            grid4.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 5)
        {
            grid5.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 6)
        {
            grid6.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 7)
        {
            grid7.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 8)
        {
            grid8.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid1.backgroundColor = .clear
            grid9.backgroundColor = .clear
        }
        else if(randomInt == 9)
        {
            grid9.backgroundColor = .black
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid1.backgroundColor = .clear
        }
        
        if(self.timeleft==0){
            timer.invalidate()
            grid1.backgroundColor = .clear
            grid2.backgroundColor = .clear
            grid3.backgroundColor = .clear
            grid4.backgroundColor = .clear
            grid5.backgroundColor = .clear
            grid6.backgroundColor = .clear
            grid7.backgroundColor = .clear
            grid8.backgroundColor = .clear
            grid9.backgroundColor = .clear
            
            let alert = UIAlertController(title: "Name", message: "Enter Gamer Name", preferredStyle: .alert)
            alert.addTextField { (tf) in tf.placeholder = "Enter Gamer Name"}
            
            let action = UIAlertAction(title: "submit", style: .default) { (_) in
                self.name = (alert.textFields?.first?.text)!
                UserDefaults.standard.setValue("sessionkey", forKey: "UserToken")
                UserDefaults.standard.setValue(self.name, forKey: "Name")
                UserDefaults.standard.setValue(self.score, forKey: "Score")
                let vc = LeaderboardVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.addAction(action)
            present(alert , animated: true , completion: nil)
        }
    }
}
