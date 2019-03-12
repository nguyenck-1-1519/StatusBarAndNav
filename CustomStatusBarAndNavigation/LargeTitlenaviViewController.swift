//
//  LargeTitlenaviViewController.swift
//  CustomStatusBarAndNavigation
//
//  Created by can.khac.nguyen on 2/14/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class LargeTitlenaviViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .blue
        navigationController?.navigationBar.barTintColor = .blue
        navigationItem.title = "ABC XYZ"
        // search controller
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        // large title
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor.green,
                 NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 30) ??
                    UIFont.systemFont(ofSize: 30)]
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PushSegue" {
            if #available(iOS 11.0, *) {
                segue.destination.navigationItem.title = "sample"
                segue.destination.navigationController?.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }
}

extension LargeTitlenaviViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell")
            as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.countLabel.text = "\(indexPath.row)"
        return cell
    }
}

extension LargeTitlenaviViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        print("a")
    }

}
