//
//  FeedsApi.swift
//  Assignment
//
//  Created by Ravi Patel on 07/10/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import Foundation
import Alamofire

class AboutApi {
    
    /**
     This function used for getting data from Backend
     - Parameters:
     - completion: use as a call back of calling function, and pass data to calling function
     */
    static func getAbout(completion: @escaping(_ data: AboutCanada?) -> ()){
        let feedsUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        AF.request(feedsUrl, method: .get).response { (response) in
            
            //Checking for data have value or nil
            guard let jsonData = response.data else {
                completion(nil)
                return
            }
            let str = String(data: jsonData, encoding: .isoLatin1)
            let data = str?.data(using: .utf8)
            //Parsing JSON
            let decoder = JSONDecoder()
            if let utf8Data = data{
                if let abouts = try? decoder.decode(AboutCanada.self, from: utf8Data) {
                    completion(abouts) // call back to calling function
                }else{
                    completion(nil) // call back to calling function
                }
            }else{
                completion(nil)
            }
        }
    }
}
