//
//  Network.swift
//  My Book
//
//  Created by Reza Kashkoul on 6/30/1400 AP.
//

import UIKit
import Alamofire

//for author
//https://www.googleapis.com/books/v1/volumes?q=\()+inauthor

//for title
//https://www.googleapis.com/books/v1/volumes?q=\()+intitle

struct BookModel : Codable {
    var items : [Item]
}

struct Item : Codable {
    var id : String?
    var volumeInfo : VolumeInfo
    var accessInfo : AccessInfo
}

struct VolumeInfo : Codable {
    var title : String?
    var authors : [String]?
    var pageCount : Int?
    var ratingCount : Int?
    var imageLinks : ImageLink?
    var averageRating : Int?
}

struct ImageLink : Codable {
    var smallThumbnail : String?
    var thumbnail : String?
}

struct AccessInfo : Codable {
    var epub : Epub?
}
struct Epub : Codable {
    var downloadLink : String?
}


class RequestsManager{
    
    func requestBooks(searchText : String? ,completion: @escaping ([Item]) -> Void){
        guard let unwrappedSearchText = searchText else { return }
        
            let apiLink = "https://www.googleapis.com/books/v1/volumes?q=\(unwrappedSearchText)+inauthor"
        let request = AF.request(apiLink)
        request.responseJSON { data in
            guard let unwrappedData = data.data else {
                completion([])
                return
            }
            if let data = try? JSONDecoder().decode(BookModel.self, from: unwrappedData ){
                completion(data.items)
                print(data.items)
                return
            }
            completion([])
        }
        
    }
}

