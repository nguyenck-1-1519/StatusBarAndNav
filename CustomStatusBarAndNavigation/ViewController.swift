//
//  ViewController.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/13/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var changeViewButton: UIButton!

    // MARK: configure status bar
    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }

    // MARK: Action handler
    @IBAction func onChangeViewButtonClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "SecondViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func onRightBarButtonClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "CustomRightBarItemViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func onCustomAppearanceButtonClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "CustomNavBackgroundViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func onLargeTitleNavButtonClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "LargeTitlenaviViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

