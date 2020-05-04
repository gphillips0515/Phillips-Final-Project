//
//  orderViewController.swift
//  Phillips Final Project
//
//  Created by Grace Phillips on 5/3/20.
//  Copyright © 2020 Grace Phillips. All rights reserved.
//

import UIKit

class orderViewController: UIViewController {
    @IBOutlet weak var nameOrder: UITextField!
    @IBOutlet weak var sandwichOrder: UITextField!
    @IBOutlet weak var sideOrder: UITextField!
    @IBOutlet weak var drinkOrder: UITextField!
    
    @IBOutlet weak var dinnerOrders: UITextView!
    
    @IBAction func takeOrder(_ sender: Any){
        let csvLine:String = "\(nameOrder.text!),\(sandwichOrder.text!),\(sideOrder.text!),\(drinkOrder.text!)\n"
               let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
               let docDir:String=paths[0]
               let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
               
               
               if !FileManager.default.fileExists(atPath: resultsFile) {
                   FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
               }
               let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
               fileHandle.seekToEndOfFile()
               fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
               fileHandle.closeFile()
               
               nameOrder.text = ""
               sandwichOrder.text = ""
               sideOrder.text = ""
               drinkOrder.text = ""
        
    }
    
    @IBAction func takeOrderAlert(_ sender: Any) {
        let alert = UIAlertController(title:"Late Night Dinner", message:"Your order has been taken!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default Action"), style: . `default`, handler: { _ in}))
                 
          self.present(alert,animated:true, completion: nil)
    }
    
    @IBAction func showOrder(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)
              let docDir:String=paths[0] as String
              let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
              
              if FileManager.default.fileExists(atPath: resultsFile)
              {
                  let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
                  let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
                  fileHandle.closeFile()
                  dinnerOrders?.text=resultsData
    }
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

