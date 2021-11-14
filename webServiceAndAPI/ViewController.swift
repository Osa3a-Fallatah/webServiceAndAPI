//
//  ViewController.swift
//  webServiceAndAPI
//
//  Created by Osama folta on 09/04/1443 AH.
//https://thatcopy.pw/catapi/
struct CatApi : Codable {
    var id :Int
    var url:String

}


import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        getinfo()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func getinfo(){
        var FishWatch=URLComponents()
        FishWatch.scheme="https"
        FishWatch.host="thatcopy.pw"
        FishWatch.path="/catapi/rest"
        let urlRequest = URLRequest(url:FishWatch.url!)
        let urlsession=URLSession.shared
        
        let task = urlsession.dataTask(with: urlRequest) {
            (data:  Data?, response: URLResponse?, error: Error?) in
            do {
                            let jsonDecoder = JSONDecoder()
                            let test = try jsonDecoder.decode(CatApi.self, from: data!)
                            print(test)
                        }catch{
                            print("Error fetcing the data:\(error)")
                        }
                    }
                    
        task.resume()
    }
}


