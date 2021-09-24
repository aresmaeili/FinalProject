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
    
    @IBAction func searchTextFieldAction(_ sender: UITextField) {
        if let inputText = searchTextField.text {
            if inputText.count > 2 {
                req.requestBooks(searchText: inputText) { items in
                    self.books = items
                    DispatchQueue.main.async {
                        self.booksTableView.reloadData()
                    }
                }
            }
        }
    }
    @IBAction func searchByeFilterSegment(_ sender: Any) {
        
    }
    
    @IBAction func changeSearchStyleButtonAction(_ sender: Any) {
        if changeSearchStyleButton.currentImage == UIImage(systemName: "person") {
            changeSearchStyleButton.setImage(UIImage(systemName: "book.closed"), for: .normal)
            searchTextField.placeholder = "Search by Book Name"
            searchMode = "intitle"
            searchTextField.text = ""
        }else{
            changeSearchStyleButton.setImage(UIImage(systemName: "person"), for: .normal)
            searchTextField.placeholder = "Search by Author Name"
            searchMode = "inauthor"
            searchTextField.text = ""


        }
    }
    
    var books = [Item]()
    var searchMode = "intitle"
    let req = RequestsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeSearchStyleButton.setTitle("", for: .normal)
        changeSearchStyleButton.setImage(UIImage(systemName: "person"), for: .normal)
        searchTextField.placeholder = "Search by Author Name"
        booksTableView.delegate = self
        booksTableView.dataSource = self
        searchTextField.delegate = self
        booksTableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "‌BookTableViewCell")
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "‌BookTableViewCell") as! BookTableViewCell
        if let bookTitle = books[indexPath.row].volumeInfo.title {
            cell.titleStackView.isHidden = false
            cell.titleDataLabel.text = bookTitle
        } else {
            cell.titleStackView.isHidden = true
        }
        if let pageCount = books[indexPath.row].volumeInfo.pageCount {
            cell.pageCountStackView.isHidden = false
            cell.pageCountDataLabel.text = pageCount.description
        } else {
            cell.pageCountStackView.isHidden = true
        }
        if let ratingCount = books[indexPath.row].volumeInfo.ratingCount {
            cell.ratingCountStackView.isHidden = false
            cell.ratingCountDataLabel.text = ratingCount.description
        } else {
            cell.ratingCountStackView.isHidden = true
        }
        if let avgRating = books[indexPath.row].volumeInfo.averageRating {
            cell.avgRatingStackView.isHidden = false
            cell.avgratingDataLabel.text = avgRating.description
        } else {
            cell.avgRatingStackView.isHidden = true
        }
        if let avgRating = books[indexPath.row].volumeInfo.averageRating {
            cell.avgRatingStackView.isHidden = false
            cell.avgratingDataLabel.text = avgRating.description
        } else {
            cell.avgRatingStackView.isHidden = true
        }
        if let image = books[indexPath.row].volumeInfo.imageLinks?.smallThumbnail {
            cell.bookImageView.isHidden = false
            cell.load(urlString: image)
        } else {
            cell.bookImageView.isHidden = true
        }
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}
