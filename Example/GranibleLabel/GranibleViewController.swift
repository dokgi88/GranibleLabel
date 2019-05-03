//
//  GranibleViewController.swift
//  GranibleLabel_Example
//
//  Created by soom on 27/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import GranibleLabel

class GranibleViewController: UIViewController {

    private let normalLabel: GranibleLabel = {
        let label = GranibleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GranibleLabel\nNormal"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.colors = [.pantone_roseQuartz, .pantone_livingCoral, .pantone_serenity]
        return label
    }()
    private let animateLabel: GranibleLabel = {
        let label = GranibleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GranibleLabel\nAnimate"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.colors = [.pantone_roseQuartz, .pantone_livingCoral, .pantone_serenity]
        label.animate = true
        return label
    }()
    private let infinityLabel: GranibleLabel = {
        let label = GranibleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GranibleLabel\nInfinity"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.colors = [.pantone_roseQuartz, .pantone_livingCoral, .pantone_serenity]
        label.animate = true
        label.infinity = true
        return label
    }()
    private let reverseLabel: GranibleLabel = {
        let label = GranibleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GranibleLabel\nReverse"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.colors = [.pantone_roseQuartz, .pantone_livingCoral, .pantone_serenity]
        label.animate = true
        label.reverse = true
        return label
    }()

    init(direction: GranibleLabelDirection) {
        super.init(nibName: nil, bundle: nil)
        title = "\(direction)"
        normalLabel.direction = direction
        animateLabel.direction = direction
        infinityLabel.direction = direction
        reverseLabel.direction = direction
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(normalLabel)
        view.addSubview(animateLabel)
        view.addSubview(infinityLabel)
        view.addSubview(reverseLabel)
        layout()
    }

}

extension GranibleViewController {

    private func layout() {
        normalLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        normalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        normalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        animateLabel.topAnchor.constraint(equalTo: normalLabel.bottomAnchor, constant: 20).isActive = true
        animateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        animateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        infinityLabel.topAnchor.constraint(equalTo: animateLabel.bottomAnchor, constant: 20).isActive = true
        infinityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infinityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        reverseLabel.topAnchor.constraint(equalTo: infinityLabel.bottomAnchor, constant: 20).isActive = true
        reverseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        reverseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }

}
