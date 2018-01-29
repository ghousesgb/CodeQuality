//
//  MoviesViewModel.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 19/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class MoviesViewModel: NSObject {
    @IBOutlet var moviesClient: MoviesClient!
    var movies: [NSDictionary]?
    
    func fetchMovies(completion: @escaping ()->()) {
        moviesClient.fetchMovies { (movies) in
            self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    func titleForItmesAtIndexPath(indexPath: IndexPath) -> String {
        let oneMoviewList = movies?[indexPath.row]
        return oneMoviewList?.value(forKeyPath: "im:name.label") as? String ?? ""
    }
}
