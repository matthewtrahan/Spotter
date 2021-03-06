//
//  ExerciseDetailsViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/3/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class ExerciseDetailsViewController: UIViewController {

    @IBOutlet weak var wv: UIWebView!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var exerciseDesc: UILabel!
    
    var selectedExercise: Exercise?
    var selectedVideo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exerciseDesc.text = selectedExercise?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadYoutube(videoID: (selectedVideo)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadYoutube(videoID: String) {
        if videoID == "" {
            // if it's a rest day, use a little image icon
            let image = #imageLiteral(resourceName: "Spotter---Rest-Icon")
            iv.image = image
        } else {
            guard
                let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
                else { return }
            wv.loadRequest(URLRequest(url: youtubeURL))
        }
    }

}
