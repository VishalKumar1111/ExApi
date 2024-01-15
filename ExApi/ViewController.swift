//
//  ViewController.swift
//  ExApi
//
//  Created by RLogixxTraining on 27/09/23.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c1ba0cd586fa4faf9f18fbe6bedc8f36")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                
              // print(json)
                //print(json!["articles"])
                var arrNews = json!["articles"] as? [Any]
                print(arrNews as Any)
            } catch {
                print("errorMsg")
            }
            
        }
    }


    @IBAction func Hitservice(_ sender: Any) {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c1ba0cd586fa4faf9f18fbe6bedc8f36")
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                  
                 if let result = response.value as? NSDictionary {
                        

                 }
        }
        
    }
}

