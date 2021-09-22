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
    
    func requestBooks(completion: @escaping ([Item]) -> Void){
        
        let link = "https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor"
        let request = AF.request(link)
        request.responseJSON { data in
            guard let unwrappedData = data.data else {
                completion([])
                return
            }
            if let data = try? JSONDecoder().decode(BookModel.self, from: unwrappedData ){
                completion(data.items)
                return
            }
            completion([])
        }
    }
}

