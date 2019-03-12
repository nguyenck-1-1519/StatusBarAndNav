//
//  CustomNavBackgroundViewController.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class CustomNavBackgroundViewController: UIViewController {
    @IBOutlet weak var headerImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // config navigation
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
//        fixedSpaceButton.width = 50
//        let titleBarButton = UIBarButtonItem(title: "Plus Ultra", style: .plain, target: self, action: nil)
//        navigationItem.leftBarButtonItems = [fixedSpaceButton, titleBarButton]
        setTransparentNavigation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetNaviToDefault()
    }

    private func setTransparentNavigation() {
        headerImageView.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

    private func setBackgroundImageForNavi() {
        headerImageView.isHidden = true
        var backgroundImage = #imageLiteral(resourceName: "nav_background_image")
        backgroundImage = backgroundImage.resizableImage(
            withCapInsets: UIEdgeInsets(top: 0,
                                        left: 0,
                                        bottom: backgroundImage.size.height - 1,
                                        right: backgroundImage.size.width - 1))
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    }

    private func resetNaviToDefault() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = nil
    }

    @IBAction func onTransparentClicked(_ sender: Any) {
        setTransparentNavigation()
    }

    @IBAction func onBackgroundImageClicked(_ sender: Any) {
        setBackgroundImageForNavi()
    }
}
