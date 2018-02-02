//
//  StudentViewController.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 29/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var studentTableView: UITableView!
    var studentViewModel = StudentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        studentViewModel.reloadStudentTableView = {[weak self] in
            self?.studentTableView.reloadData()
        }
    }
    
    @IBAction func addRecordButtonAction(_ sender: UIButton) {
        guard let name = nameTextField.text else {
            return
        }
        guard let address = addressTextField.text else {
            return
        }
        if !Utilities.validate(text: name, maxLength: 20) {
            Utilities.showAlertOnlyOk(withTitle: "Problem", okTitle: "Ok", message: "Invalid name provided", inViewController: self)
            return
        }
        if !Utilities.validate(text: address, maxLength: 40) {
            Utilities.showAlertOnlyOk(withTitle: "Problem", okTitle: "Ok", message: "Invalid address provided", inViewController: self)
            return
        }
        studentViewModel.addStudentRecordWith(name: name, address: address)
        clearTextFields()
    }
    
    func clearTextFields() {
        nameTextField.text     = ""
        addressTextField.text  = ""
    }
}

extension StudentViewController : UITableViewDataSource {
    func setupTableView() {
        self.studentTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : StudentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        cell.studentObj = studentViewModel.studentCellForRowAt(indexPath: indexPath) as Student
        return cell
    }
}
