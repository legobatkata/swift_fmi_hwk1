//
//  Utils.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 12.11.24.
//

import Foundation

class Utils {
    
    public static let shared = Utils()
    
    public func getBookDataFromBundle() -> Book? {
        if let path = Bundle.main.path(forResource: "game_script", ofType: "json") {
            do {
                let fileContent = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                let jsonData = Data(String(fileContent).utf8)
                let bookData: Book = try JSONDecoder().decode(Book.self, from: jsonData)
                return bookData
            } catch {
                print("err")
            }
        }
        return nil
    }
    
    public func getChapterById(id: String) -> Chapter? {
        let bookData = getBookDataFromBundle()
        if let book = bookData, let chapters = book.chapters {
            return chapters.filter({$0.id == id}).first
        }
        return nil
    }
    
}
