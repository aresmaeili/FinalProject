//
//  ViewController.swift
//  final
//
//  Created by Roham on 6/30/1400 AP.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeSearchStyleButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var booksTableView: UITableView!
    @IBAction func searchByeFilterSegment(_ sender: Any) {
        
    }
    @IBAction func changeSearchStyleButtonAction(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        booksTableView.delegate = self
        booksTableView.dataSource = self
        booksTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }


}
extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

