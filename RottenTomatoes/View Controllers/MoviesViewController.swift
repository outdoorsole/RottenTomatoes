//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by m on 4/3/22.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var movies: [[String: Any]]?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://www.rottentomatoes.com/api/private/v2.0/browse?type=in-theaters") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                    if let json = jsonObject {
                        self.movies = json["results"] as? [[String: Any]]
                    }
                } catch {}
            }
        }
        .resume()
    }

}
