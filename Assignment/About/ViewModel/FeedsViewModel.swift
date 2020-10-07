//
//  FeedsViewModel.swift
//  Assignment
//
//  Created by Ravi Patel on 07/10/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

class FeedsViewModel: NSObject {
    
    /**
     This function used for getting feeds
     - Parameters:
     - completion: completion handler will be used as a call back to inform calling function
     */
    func getAboutCanada(completion: @escaping(_ about: AboutCanada?) ->()){
        AboutApi.getAbout { (abouts) in
            guard let about = abouts else {
                completion(nil)
                return
            }
            completion(about)  // Sending Call back to calling function
        }
    }
}
