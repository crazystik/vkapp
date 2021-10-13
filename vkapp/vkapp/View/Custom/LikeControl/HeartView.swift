//
//  HeartView.swift
//  vkapp
//
//  Created by Pavel Lazarev on 23.09.2021.
//

import UIKit

class HeartView: UIView {
    
    @IBInspectable
    public var isFilled: Bool = true
    @IBInspectable
    public var strokeWidth: CGFloat = 1.0
    @IBInspectable
    public var filledColor: UIColor = .systemRed
    @IBInspectable
    public var commonColor: UIColor = .systemBlue

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
    }
    
    private func setupView() {
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let heartPath = heartPath(with: self.bounds)

        heartPath.lineWidth = self.strokeWidth
        
        if isFilled {
            self.filledColor.setStroke()
            self.filledColor.setFill()
            heartPath.fill()
        } else {
            self.commonColor.setStroke()
        }
        
        heartPath.stroke()
    }
    
    private func heartPath(with rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2

        path.addArc(
            withCenter: CGPoint(
                x: rect.width * 0.3,
                y: rect.height * 0.35
            ),
            radius: arcRadius,
            startAngle: 135 * .pi / 180,
            endAngle: 315 * .pi / 180,
            clockwise: true
        )

        path.addLine(
            to: CGPoint(
                x: rect.width/2,
                y: rect.height * 0.2
            )
        )

        path.addArc(
            withCenter: CGPoint(
                x: rect.width * 0.7,
                y: rect.height * 0.35
            ),
            radius: arcRadius,
            startAngle: 225 * .pi / 180,
            endAngle: 45 * .pi / 180,
            clockwise: true
        )

        path.addLine(
            to: CGPoint(
                x: rect.width * 0.5,
                y: rect.height * 0.95
            )
        )

        path.close()
        
        return path
    }
}
