//
//  ViewController.swift
//  httpsTruncated
//
//  Created by jackfrow on 2021/6/21.
//

import UIKit
import Alamofire


let requestUrl = "https://juejin.cn"

let manager  = Session(serverTrustManager:CustomServerTrustPolicyManager(evaluators: [:]))
class CusTrustEvaluator: ServerTrustEvaluating {
    func evaluate(_ trust: SecTrust, forHost host: String) throws {
       print("trust\(trust)host\(host)")
    }
}

final class CustomServerTrustPolicyManager: ServerTrustManager {
    let eva = CusTrustEvaluator()
    override func serverTrustEvaluator(forHost host: String) -> ServerTrustEvaluating? {
        return eva
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loadRequest()
        
    }

    func loadRequest()  {
        
        guard let url = URL(string: requestUrl) else {
            return
        }
        
        manager.request(url,method: .get).responseJSON { (response) in
            print("[Print you response json]")
//            print("[responseJSON] \(response.response)")
        }
        
    }

}

