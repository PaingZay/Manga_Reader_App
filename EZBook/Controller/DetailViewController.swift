//
//  DetailViewController.swift
//  EZBook
//
//  Created by Paing Zay on 26/11/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var chaptersTableView: UITableView!
    @IBOutlet weak var synopsisView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var readMore: UIButton!
    @IBOutlet weak var synopsis: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChaptersTableViewCell", bundle: nil)
        chaptersTableView.register(nib, forCellReuseIdentifier: "reusableChaptersTableViewCell")
        
        chaptersTableView.dataSource = self
        
        setUpView()
    }
    
    func setUpView() {
        synopsisView.layer.shadowColor = UIColor.black.cgColor // Shadow color
        synopsisView.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow offset (x, y)
        synopsisView.layer.shadowOpacity = 0.5 // Shadow opacity
        synopsisView.layer.shadowRadius = 4.0 // Shadow radius
        synopsisView.layer.masksToBounds = false // Allow the shadow to be visible beyond the view's bounds
        
        synopsisView.layer.cornerRadius = 5
        
        //Inner Shadow
//        // Create a gradient layer
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = coverImage.bounds
//
//        // Define the colors for the gradient (transparent to black)
//        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
//
//        // Define the locations for the gradient colors
//        gradientLayer.locations = [0.0, 1.0]
//
//        // Set the gradient direction from top to bottom
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//
//        // Add the gradient layer as an overlay to the cover image
//        coverImage.layer.addSublayer(gradientLayer)
        
        applyCircularGradient()
    }
    
    func applyCircularGradient() {
            let gradientLayer = CAGradientLayer()
        gradientLayer.frame = coverImage.bounds
            
            let gradientColors = [
                UIColor.clear.cgColor,
                UIColor.black.cgColor,
                UIColor.black.cgColor,
                UIColor.black.cgColor,
                UIColor.clear.cgColor
            ]
            
            gradientLayer.colors = gradientColors
            
            // Define locations to create a circular gradient
            gradientLayer.locations = [0.0, 0.2, 0.5, 0.8, 1.0]
            
            // Adjust the gradient to make it circular
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            
        coverImage.layer.mask = gradientLayer
        }
    
    var isExpanded = false
    
    @IBAction func didTapReadMore(_ sender: Any) {
        
        isExpanded.toggle() // Toggle label state
        
        UIView.transition(with: synopsis, duration: 0.3, options: .transitionFlipFromTop) {
                if self.isExpanded {
                    // Expand label by setting to 0 for multiline
                self.synopsis.numberOfLines = 0
                } else {
                    // Collapse label to two lines
                    self.synopsis.numberOfLines = 2
                }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableChaptersTableViewCell", for: indexPath) as! ChaptersTableViewCell
        
        return cell
    }
}
