//
//  MovieDetailsViewController.swift
//  RottenTomatoes
//
//  Created by m on 4/7/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!

    var movie: [String: Any]?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let movie = movie else { return }

        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["synopsis"] as? String

        if let urlString = (movie as NSDictionary).value(forKeyPath: "posters.primary") as? String, let url = URL(string: urlString) {
            imageView.setImageWith(url)
        }
    }

}
