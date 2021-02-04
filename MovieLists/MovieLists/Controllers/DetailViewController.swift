//
//  DetailViewController.swift
//  MovieLists
//
//  Created by Karlis Butins on 04/02/2021.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleNameLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if movie != nil{
            titleImageView.image = UIImage(named: movie.poster)
            titleNameLabel.text = movie.title + " - " + movie.year
            titleNameLabel.numberOfLines = 0
            
        }
     }
    

}
