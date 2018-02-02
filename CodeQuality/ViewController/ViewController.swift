//
//  ViewController.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 12/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit
/*struct Rectangle {
    var width : Float
    var height : Float
    func area() -> Float {
        return width * height
    }
    mutating func scaleBoth(by: Float) { //Mutating should be used as thes "struct" member are been modified
        width *= by
        height *= by
    }
}
class ClassRectangle {
    var width : Float = 0.0
    var height : Float = 0.0
    func area() -> Float {
        return width * height
    }
    func scaleBoth(by: Float) { // Here Mutating not required reference nature of class
        width *= by
        height *= by
    }
}*/

class ViewController: UIViewController {
    @IBOutlet var moviesViewModel : MoviesViewModel?
    @IBOutlet weak var moviesTableView: UITableView!
    var apiStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesViewModel?.fetchMovies {[unowned self] in
            self.apiStatus =  true
            DispatchQueue.main.async {[unowned self] in
                self.moviesTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (moviesViewModel?.numberOfItemsInSection(section: section))!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath) as UITableViewCell
        configureCell(cell: cell, forRowAtIndexPath:indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        let title = moviesViewModel?.titleForItmesAtIndexPath(indexPath: forRowAtIndexPath)
        cell.textLabel?.text = title
    }
}
