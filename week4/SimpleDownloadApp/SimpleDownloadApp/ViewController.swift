//
//  ViewController.swift
//  SimpleDownloadApp
//
//  Created by Neal on 2019/11/29.
//  Copyright © 2019 neal812220. All rights reserved.
//

import UIKit


struct AllData: Decodable {
    var stationID: String?
    var stationName: String?
    var stationAddress: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var stationID: UILabel!
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var stationAddress: UILabel!
    
    let url = "https://stations-98a59.firebaseio.com/practice.json"
    let session = URLSession(configuration: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadFormURL(urlAddress: url)
    }
    
    
    func downloadFormURL(urlAddress: String) {
        if let url = URL(string: urlAddress) {
            DispatchQueue.global().async {
                let task = self.session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        let errorCode = (error! as NSError).code
                        if errorCode == -1009 {
                            DispatchQueue.main.async {
                                self.errorAlert(message: "No Internet Connection")
                            }
                        }else {
                            DispatchQueue.main.async {
                                self.errorAlert(message: "something's wrong")
                            }
                        }
                    }
                    if let loadData = data {
                        do{
                            let decodeData = try JSONDecoder().decode(AllData.self, from: loadData)
                            guard let id = decodeData.stationID else{return}
                            guard let name = decodeData.stationName else{return}
                            guard let address = decodeData.stationAddress else{return}
                            DispatchQueue.main.async {
                                self.stationID.text = id
                                self.stationName.text = name
                                self.stationAddress.text = address
                            }
                            
                        }catch {
                            DispatchQueue.main.async {
                                self.errorAlert(message: "something's wrong")
                            }
                        }
                    }
                }
                task.resume()
            }
            
        }
    }
    
    
    
    func errorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }



}

