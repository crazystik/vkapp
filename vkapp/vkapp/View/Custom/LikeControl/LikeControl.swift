//
//  LikeControl.swift
//  vkapp
//
//  Created by Pavel Lazarev on 23.09.2021.
//

import UIKit

class LikeControl: UIControl {
    
    private lazy var heartView: HeartView = {
        let view = HeartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isFilled = false
        return view
    }()
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(0)
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .right
        label.textColor = .systemBlue
        return label
    }()
    
    public var isFilled: Bool = false {
        willSet {
            self.filledAction(newValue)
        }
    }
    
    public var counter: Int = 0 {
        willSet {
            self.setCountText(counter: newValue)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        
        self.setupHeartView()
        self.setupCounterLabel()
        
        self.addTapGesture()
    }
    
    private func setupHeartView() {
        self.addSubview(self.heartView)
        self.heartView.topAnchor
            .constraint(equalTo: self.topAnchor).isActive = true
        self.heartView.rightAnchor
            .constraint(equalTo: self.rightAnchor).isActive = true
        self.heartView.bottomAnchor
            .constraint(equalTo: self.bottomAnchor).isActive = true
        self.heartView.widthAnchor
            .constraint(equalTo: self.heartView.heightAnchor).isActive = true
    }
    
    private func setupCounterLabel() {
        self.addSubview(self.counterLabel)
        self.counterLabel.topAnchor
            .constraint(equalTo: self.topAnchor).isActive = true
        self.counterLabel.leftAnchor
            .constraint(equalTo: self.leftAnchor).isActive = true
        self.counterLabel.rightAnchor
            .constraint(equalTo: self.heartView.leftAnchor, constant: -8).isActive = true
        self.counterLabel.bottomAnchor
            .constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func addTapGesture() {
        self.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.tapAction)
            )
        )
    }
    
    @objc
    private func tapAction() {
        isFilled.toggle()
    }
    
    private func filledAction(_ isFilled: Bool) {
        self.counter += isFilled ? 1 : -1
        self.heartView.isFilled = isFilled
        self.heartView.setNeedsDisplay()
        self.counterLabel.textColor = isFilled ? .systemRed : .systemBlue
    }
    
    private func setCountText(counter: Int) {
        self.counterLabel.text = String(counter)
    }
}
