//
//  ViewController.swift
//  GranibleLabel
//
//  Created by dokgi1988 on 04/26/2019.
//  Copyright (c) 2019 dokgi1988. All rights reserved.
//

import UIKit
import GranibleLabel

class ViewController: UIViewController {

    private enum GranibleLabelDirections: String, CaseIterable {
        case top
        case bottom
        case left
        case right
        case leftTopDiagonal
        case leftBottomDiagonal
        case rightTopDiagonal
        case rightBottomDiagonal

        var direction: GranibleLabelDirection {
            switch self {
            case .top:
                return GranibleLabelDirection.top
            case .bottom:
                return GranibleLabelDirection.bottom
            case .left:
                return GranibleLabelDirection.left
            case .right:
                return GranibleLabelDirection.right
            case .leftTopDiagonal:
                return GranibleLabelDirection.leftTopDiagonal
            case .leftBottomDiagonal:
                return GranibleLabelDirection.leftBottomDiagonal
            case .rightTopDiagonal:
                return GranibleLabelDirection.rightTopDiagonal
            case .rightBottomDiagonal:
                return GranibleLabelDirection.rightBottomDiagonal
            }
        }
    }

    private var titles: [String] {
        return GranibleLabelDirections.allCases.map{$0.rawValue}
    }
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        layout()
    }

    private func layout() {
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let directions = GranibleLabelDirections.allCases.map{$0.direction}
        let controller = GranibleViewController(direction: directions[indexPath.row])
        show(controller, sender: nil)
    }

}
