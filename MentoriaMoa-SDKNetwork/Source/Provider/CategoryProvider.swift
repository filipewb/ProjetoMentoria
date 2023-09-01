//
//  CategoryProvider.swift
//  MentoriaMoa-SDKNetwork
//
//  Created by Eduardo Hoffmann on 01/09/23.
//

import Foundation

class CategoryProvider {
    init() {
        
    }
    
    public func getListCategory(uIdFirebase: String, completionHandler: @escaping (Result<[CategoryModel], Error>) -> Void) {
        
        let urlStr = "\(Constants.urlBase)/Api/Theme/GetListaTheme?uIdFirebase=\(uIdFirebase)"
        debugPrint(urlStr)
        
        guard let url = URL(string: urlStr) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPRequestMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                if let error {
                    completionHandler(.failure(error))
                }
                
                if let data {
                    let dataStr = String(data: data, encoding: .utf8)
                    debugPrint(dataStr as Any)
                    
                    if let jsonData = dataStr?.data(using: .utf8) {
                        if jsonData.isEmpty {
                            completionHandler(.success([CategoryModel]()))
                        } else {
                            let result = try JSONDecoder().decode([CategoryModel].self, from: jsonData)
                            completionHandler(.success(result))
                        }
                    }
                }
            } catch let error as NSError {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
