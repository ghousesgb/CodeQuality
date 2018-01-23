//
//  WebServiceManager.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 16/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

class WebServiceManager {
    class func makeAPICallsWith(urlString:String, methodName method: String, headers: [String : AnyObject]?, httpBody: Data?, successHandler:@escaping (AnyObject?, HTTPURLResponse?) -> Void, failureHandler:@escaping (HTTPURLResponse?, Error?) -> Void) {
        
        let config = URLSessionConfiguration.ephemeral
        if let headers = headers {
            config.httpAdditionalHeaders = headers
        }
        let session = URLSession(configuration: config)
        var url: NSURL?
        url = NSURL(string: urlString)
        let request = NSMutableURLRequest(url: url! as URL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        request.httpMethod = method
        if let httpBody = httpBody {
            request.httpBody = httpBody as Data
        }
        
        session.dataTask(with: request as URLRequest, completionHandler: {
            ( data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                guard error == nil else {
                    failureHandler(httpResponse, error)
                    return
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        successHandler(json as AnyObject?, httpResponse)
                    } catch let error as NSError  {
                        failureHandler(httpResponse, error)
                    }
                } else {
                    failureHandler(httpResponse, error)
                }
            }
        }).resume()
    }
}
