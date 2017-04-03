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
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        wv.loadRequest(URLRequest(url: youtubeURL))
    }

}
