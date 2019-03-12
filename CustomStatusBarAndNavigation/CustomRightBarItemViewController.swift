//
//  CustomRightBarItemViewController.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

enum RightBarButtonType: Int {
    case title
    case image
    case view
}

class CustomButton: UIButton {
    var alignmentRectInsetsOverride: UIEdgeInsets?
    override var alignmentRectInsets: UIEdgeInsets {
        return alignmentRectInsetsOverride ?? super.alignmentRectInsets
    }
}

class CustomRightBarItemViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var showHidePromtButton: UIButton!

    let showPromtStr = "Show Promt"
    let hiddenPromtStr = "Hidden Promt"
    let promtStr = "Navigation Promt"

    var customType: RightBarButtonType = .title {
        didSet {
            updateNaviAppearance()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // config navigation
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.tintColor = .green
        navigationItem.title = "Custom right view"
        updateNaviAppearance()
        updatePromt(title: promtStr)
    }

    private func updateNaviAppearance() {
        switch customType {
        case .title:
            let titleBarButton = UIBarButtonItem(title: "Plus Ultra", style: .plain, target: self, action: nil)
            navigationItem.rightBarButtonItem = titleBarButton
        case .image:
            let imageBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "game_icon"), style: .plain, target: self, action: nil)
            navigationItem.rightBarButtonItem = imageBarButton
        default:
            let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
            fixedSpace.width = 8
            navigationItem.rightBarButtonItems = [fixedSpace,
                                                  UIBarButtonItem(customView: createCustomButton(offset: fixedSpace.width,
                                                                                                 color: .red)),
                                                  UIBarButtonItem(customView: createCustomButton(offset: fixedSpace.width,
                                                                                                 color: .green))]
        }
    }

    func createCustomButton(offset: CGFloat = 0, color: UIColor) -> UIButton {
        let button = CustomButton(frame: CGRect(x:0, y: 0, width: 24, height: 24))
        button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: -offset, bottom: 0, right: offset)
        button.addTarget(self, action: #selector(onCustomViewClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        return button
    }

    @objc func onCustomViewClicked() {
        print("Right view's button is clicked")
    }

    private func updatePromt(title: String?) {
        navigationItem.prompt = title
    }

    @IBAction func onSegmentClicked(_ sender: UISegmentedControl) {
        customType = RightBarButtonType(rawValue: segmentControl.selectedSegmentIndex) ?? .title
    }

    @IBAction func onShowHidePromtClicked(_ sender: UIButton) {
        if showHidePromtButton.titleLabel?.text == hiddenPromtStr {
            showHidePromtButton.setTitle(showPromtStr, for: .normal)
            updatePromt(title: nil)
        } else {
            showHidePromtButton.setTitle(hiddenPromtStr, for: .normal)
            updatePromt(title: promtStr)
        }
    }
}
