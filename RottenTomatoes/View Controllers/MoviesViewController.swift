//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by m on 4/3/22.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://www.rottentomatoes.com/api/private/v2.0/browse?type=in-theaters") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data)
                    print(jsonObject)
                } catch {}
            }
        }
        .resume()
    }

}
