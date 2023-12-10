//
// CanvasViewController.swift
// StyloFlow
//
// Created by 曾問 on 2023
// Copyright © 2023 WUN TSENG.
// All Rights Reserved.
//

import PencilKit
import SnapKit
import UIKit

class CanvasViewController: UIViewController {
    private let canvasView: PKCanvasView = .init()
    private lazy var toolPicker: PKToolPicker = {
        // Set up the tool picker
        if #available(iOS 14.0, *) {
            return PKToolPicker()
        } else {
            // Set up the tool picker, using the window of our parent because our view has not
            // been added to a window yet.
            guard let window = parent?.view.window else { return .init() }
            return PKToolPicker.shared(for: window) ?? .init()
        }
    }()

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
        view.addSubview(canvasView)

        canvasView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }
}

// MARK: PKToolPickerObserver
extension CanvasViewController: PKToolPickerObserver {
    func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {}

    func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {}

    func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {}

    func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {}
}
