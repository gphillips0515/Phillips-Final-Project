//
//  menuViewController.swift
//  Phillips Final Project
//
//  Created by Grace Phillips on 5/3/20.
//  Copyright © 2020 Grace Phillips. All rights reserved.
//

import UIKit
import WebKit
class menuViewController: UIViewController {

    @IBOutlet weak var menuPDF: WKWebView!
    @IBOutlet weak var imageInfo: UIImageView!
    @IBOutlet weak var segmentInfo: UISegmentedControl!
    @IBOutlet weak var tapOutput: UILabel!
    
    
    
    @IBAction func segmentAction(_ sender: Any) {
        if segmentInfo.selectedSegmentIndex == 0{
            imageInfo.isHidden = false
        }
        if segmentInfo.selectedSegmentIndex == 1{
            imageInfo.isHidden = true
        }
    }
    
   
    @IBAction func foundTap(_ sender: Any) {
    tapOutput.text = "Check out our great menu!"
    }
    
            
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Menupdf", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        menuPDF.load(request)
        
         

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
