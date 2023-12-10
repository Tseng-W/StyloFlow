//
// MainViewController.swift
// StyloFlow
//
// Created by 曾問 on 2023
// Copyright © 2023 WUN TSENG.
// All Rights Reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        navigationController?.setViewControllers([CanvasViewController()], animated: false)
//        let toDrawItem = UIBarButtonItem(title: "Draw", style: .plain, target: self, action: #selector(toDrawView(_:)))
//        toDrawItem.action = #selector(toDrawView(_:))
//        navigationItem.rightBarButtonItem = toDrawItem
    }

//    @objc private func toDrawView(_ item: UIBarButtonItem) {
//        let canvasView = CanvasViewController()
//        navigationController?.pushViewController(canvasView, animated: true)
//    }
}
