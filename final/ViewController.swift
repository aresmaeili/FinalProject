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
        if changeSearchStyleButton.currentImage == UIImage(systemName: "person") {
            changeSearchStyleButton.setImage(UIImage(systemName: "book.closed"), for: .normal)
            searchTextField.placeholder = "Search by Book Name"
        }else{
            changeSearchStyleButton.setImage(UIImage(systemName: "person"), for: .normal)
            searchTextField.placeholder = "Search by Author Name"

        }
    }
    var books = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeSearchStyleButton.setTitle("", for: .normal)
        changeSearchStyleButton.setImage(UIImage(systemName: "person"), for: .normal)
        searchTextField.placeholder = "Search by Author Name"
        booksTableView.delegate = self
        booksTableView.dataSource = self
        booksTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let req = RequestsManager()
        req.requestBooks { items in
            self.books = items
            DispatchQueue.main.async {
                self.booksTableView.reloadData()
            }
        }
        
    }
    

}
extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
//        cell.
        return cell
    }
    
    
}

