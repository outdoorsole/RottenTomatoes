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

// Data Source: Specifies the data of the tableView
extension MoviesViewController: UITableViewDataSource {

    // Required data source methods:
    // (1) tableView(_:numberOfRowsInSection:) - sets the number of rows for each section to display
    // (2) tableView(_:cellForRowAt:) - configures the instance of the cell at the indexPath

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        return cell
    }

}

// Delegate: Handles the events
extension MoviesViewController: UITableViewDelegate {}
