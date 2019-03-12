//
//  SecondViewController.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/13/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var hiddenStatusBarButton: UIButton!
    @IBOutlet weak var styleStatusBarButton: UIButton!

    var isStatusBarHidden = false {
        didSet {
            updateHiddenStatusBarButtonAppearance()
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            updateStyleStatusBarButtonAppearance()
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: Custom Status bar
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure navigation
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.setNavigationBarHidden(true, animated: false)

        navigationController?.navigationBar.tintColor = .green
    }

    // MARK: Private function
    private func updateHiddenStatusBarButtonAppearance() {
        hiddenStatusBarButton.backgroundColor = isStatusBarHidden ? .gray : .blue
        hiddenStatusBarButton.setTitle(isStatusBarHidden ? "YES" : "NO", for: .normal)
    }

    private func updateStyleStatusBarButtonAppearance() {
        let isDefaultStatusBar = statusBarStyle == .default
        styleStatusBarButton.backgroundColor = isDefaultStatusBar  ? .white : .black
        styleStatusBarButton.setTitle(isDefaultStatusBar ? "Default" : "Light content", for: .normal)
        styleStatusBarButton.setTitleColor(isDefaultStatusBar ? .black : .white, for: .normal)
    }

    // MARK: Action handler
    @IBAction func onDismissButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func onHiddenStatusBarButtonClicked(_ sender: UIButton) {
        isStatusBarHidden.toggle()
    }

    @IBAction func onStyleStatusBarButtonClicked(_ sender: UIButton) {
        statusBarStyle = statusBarStyle == .default ? .lightContent : .default
        UIApplication.shared.isNetworkActivityIndicatorVisible = statusBarStyle == .default
    }
    
}
