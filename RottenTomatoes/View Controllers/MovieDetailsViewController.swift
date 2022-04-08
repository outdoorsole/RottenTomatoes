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

    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["synopsis"] as? String
    }

}
