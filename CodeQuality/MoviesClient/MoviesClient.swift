//
//  MoviesClient.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 19/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    typealias completionHandler = ([NSDictionary]?)->Void
    func fetchMovies(completion:@escaping completionHandler) {
        
        //fetch movies data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = NSURL(string:urlString)!
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        let request = NSMutableURLRequest(url: url as URL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        
        session.dataTask(with: request as URLRequest, completionHandler: {
            ( data, response, error) in
           
            guard error == nil else {
                completion(nil)
                return
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
                    if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                        completion(movies)
                        return
                    }
                } catch let error as NSError  {
                    completion(nil)
                }
               
            }
        }).resume()
    }
}
