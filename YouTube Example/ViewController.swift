//
//  ViewController.swift
//  YouTube Example
//
//  Created by Sean Allen on 4/9/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createVideoArray()
        addNavBarImage()
        navigationController?.isNavigationBarHidden = true
    }
    

    func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "youtube-logo")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
    
    func createVideoArray() {
        
        let video1 = Video(image: #imageLiteral(resourceName: "fb-story-3-card"), url: "https://youtu.be/DkCoGkyxMxY", title: "Facebook Interview 3")
        let video2 = Video(image: #imageLiteral(resourceName: "podcast-card"), url: "https://youtu.be/0F_ZHZOuSi4", title: "iOS Podcasts")
        let video3 = Video(image: #imageLiteral(resourceName: "ss-button-anim-card"), url: "https://youtu.be/ox2MieJzcRQ", title: "UIButton Animations")
        let video4 = Video(image: #imageLiteral(resourceName: "ss-sort-array-card"), url: "https://youtu.be/vJdn_fdzpS4", title: "Sort Array by Value")
        let video5 = Video(image: #imageLiteral(resourceName: "ss-uipickerview-card"), url: "https://youtu.be/HkDDGfMiuOA", title: "UIPickerView Tutorial")
        let video6 = Video(image: #imageLiteral(resourceName: "swift-objc-card"), url: "https://youtu.be/6o8rl5PVOqU", title: "Swift or Objective-C?")
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        videos.append(video6)
    }
}


extension ViewController: VideoCellDelegate {

    func didTapWatchLater(title: String) {
        
        let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later List"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func didTapWatchNow(url: String) {
        
        let videoURL = URL(string: url)!
        let safariVC = SFSafariViewController(url: videoURL)
        present(safariVC, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let video = videos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        cell.delegate = self
        
        return cell
    }
}

