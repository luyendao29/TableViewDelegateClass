//
//  DetailViewController.swift
//  TableviewDelegate
//
//  Created by Anh vũ on 3/28/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name_label: UILabel!
    
    var macOS: MacOs?
    var toolViewDelegate: ToolViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        if let macOS = macOS, let imageData = macOS.image {
            photo?.image    = UIImage(data:imageData)
            name_label.text = macOS.name
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let toolviewController = segue.destination as?ToolViewController else {return}
        toolviewController.delegate  = toolViewDelegate
        toolviewController.macOS = macOS
        
    }
    
    
    
}
