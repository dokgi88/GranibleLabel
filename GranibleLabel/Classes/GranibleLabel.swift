//
//  GranibleLabel.swift
//  GranibleLabel
//
//  Created by soom on 26/04/2019.
//

import UIKit

public class GranibleLabel: UIView {

    public var text: String? {
        didSet {
            guard let text = text else {return}
            gradientLabel.text = text
        }
    }
    public var font: UIFont? {
        didSet {
            guard let font = font else {return}
            gradientLabel.font = font
        }
    }
    public var numberOfLines: Int? {
        didSet {
            guard let numberOfLines = numberOfLines else {return}
            gradientLabel.numberOfLines = numberOfLines
        }
    }
    public var textAlignment: NSTextAlignment? {
        didSet {
            guard let textAlignment = textAlignment else {return}
            gradientLabel.textAlignment = textAlignment
        }
    }
    public var colors: [UIColor]? {
        didSet {
            guard let colors = colors else {return}
            gradient.colors = colors.map{$0.cgColor}
        }
    }
    public var reverse: Bool? {
        didSet {
            guard let reverse = reverse else {return}
            gradientAnimation.autoreverses = reverse
        }
    }
    public var duration: Double? {
        didSet {
            guard let duration = duration else {return}
            gradientAnimation.duration = duration
        }
    }
    public var direction: GranibleLabelDirection?
    public var animate = false
    public var infinity = false
    
    private let gradientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    private let gradientAnimation: CABasicAnimation = {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = .infinity
        gradientAnimation.isRemovedOnCompletion = false
        return gradientAnimation
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addSubview(gradientLabel)
        layout()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = .clear
        addSubview(gradientLabel)
        layout()
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setGradientLayer()
    }
    
    private func setGradientLayer() {
        gradient.frame = bounds
        gradient.mask = gradientLabel.layer
        layer.addSublayer(gradient)
    }
    
    override public func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        guard newWindow != nil else {return}
        setGradient()
    }
    
    private func setGradient() {
        if infinity, let colors = colors, let firstColor = colors.first {
            self.colors?.append(firstColor)
        }
        
        guard let gradientDirection = direction else {return}
        switch gradientDirection {
        case .top:
            gradient.startPoint = animate ? CGPoint(x: 0.5, y: -0.3):CGPoint(x: 0.5, y: 0.3)
            gradient.endPoint = animate ? CGPoint(x: 0.5, y: 1.3):CGPoint(x: 0.5, y: 0.7)
        case .bottom:
            gradient.startPoint = animate ? CGPoint(x: 0.5, y: 1.3):CGPoint(x: 0.5, y: 0.7)
            gradient.endPoint = animate ? CGPoint(x: 0.5, y: -0.3):CGPoint(x: 0.5, y: 0.3)
        case .left:
            gradient.startPoint = animate ? CGPoint(x: -0.3, y: 0.5):CGPoint(x: 0.2, y: 0.5)
            gradient.endPoint = animate ? CGPoint(x: 1.3, y: 0.5):CGPoint(x: 0.8, y: 0.5)
        case .right:
            gradient.startPoint = animate ? CGPoint(x: 1.3, y: 0.5):CGPoint(x: 0.8, y: 0.5)
            gradient.endPoint = animate ? CGPoint(x: -0.3, y: 0.5):CGPoint(x: 0.2, y: 0.5)
        case .leftTopDiagonal:
            gradient.startPoint = animate ? CGPoint(x: -0.3, y: -0.3):CGPoint(x: 0.3, y: 0.3)
            gradient.endPoint = animate ? CGPoint(x: 1.3, y: 1.3):CGPoint(x: 0.7, y: 0.7)
        case .leftBottomDiagonal:
            gradient.startPoint = animate ? CGPoint(x: -0.3, y: 1.3):CGPoint(x: 0.3, y: 0.7)
            gradient.endPoint = animate ? CGPoint(x: 1.3, y: -0.3):CGPoint(x: 0.7, y: 0.3)
        case .rightTopDiagonal:
            gradient.startPoint = animate ? CGPoint(x: 1.3, y: -0.3):CGPoint(x: 0.7, y: 0.3)
            gradient.endPoint = animate ? CGPoint(x: -0.3, y: 1.3):CGPoint(x: 0.3, y: 0.7)
        case .rightBottomDiagonal:
            gradient.startPoint = animate ? CGPoint(x: 1.3, y: 1.3):CGPoint(x: 0.7, y: 0.7)
            gradient.endPoint = animate ? CGPoint(x: -0.3, y: -0.3):CGPoint(x: 0.3, y: 0.3)
        }
        
        guard animate, let colors = colors else {return}
        var fromValue = Array(repeating: 0.0, count: colors.count-1)
        fromValue.append(0.25)
        var toValue = Array(repeating: 1.0, count: colors.count-1)
        toValue.insert(0.75, at: 0)
        
        gradientAnimation.fromValue = fromValue
        gradientAnimation.toValue = toValue
        gradient.locations = [0.0, 0.5]
        gradient.add(gradientAnimation, forKey: "gradientAnimation")
    }
    
}

extension GranibleLabel {
    
    private func layout() {
        gradientLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradientLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        gradientLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        gradientLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
