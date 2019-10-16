//
//  Connectivity.swift
//  mfgodat
//
//  Created by Mobark on 15/10/2019.
//  Copyright © 2019 ff8aaf. All rights reserved.
//
import Alamofire

class Connectivity{
    func loadFromServer(url: String,completion : @escaping ([Dictionary<String,Any>])->())  {
        var dat = [Dictionary<String,Any>]()
        Alamofire.request(url, method: .get)
            .response {response in
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: response.data!, options : JSONSerialization.ReadingOptions.allowFragments) as? [Dictionary<String,Any>]
                    {
                        dat = jsonArray
                    } else {
                        print("bad json")
                    }
                } catch let error as NSError {
                    print(error)
                }
                completion(dat)
        }
    }
}
