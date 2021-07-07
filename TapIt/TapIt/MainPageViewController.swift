//
//  MainPageViewController.swift
//  TapIt
//
//  Created by DCS on 06/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
class MainPageViewController: UIViewController {
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "tap.png")
        imageView.backgroundColor = .clear
        return imageView
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Let's Tap", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(MoveToNextPage), for: .touchUpInside)
        return button
    }()
    private let myTextView : UITextView = {
        let textView = UITextView()
        textView.text = "-> If tap On Wrong Box -5.\n->Tap On Highlighted +10.\n-> Tap Within Given Time.\n-> Click Start To Begin.."
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(myButton)
        view.addSubview(myTextView)
        //view.addSubview(myImageView)
        self.title = "TapMe"
        self.view.backgroundColor = .white
    }
    @objc func MoveToNextPage(){
       // print("called..")
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
      myImageView.frame = CGRect(x: 70, y: view.height/2-170, width: view.width-160, height:90)
        myButton.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
        myTextView.frame = CGRect(x: 40, y: view.height/2+50, width: view.width-80, height: 160)
    }
}
