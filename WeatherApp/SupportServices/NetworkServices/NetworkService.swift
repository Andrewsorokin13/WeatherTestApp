//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 08.02.2022.
//

import Foundation
 
protocol NetworkServiceProtocol{
    func request(urlSring: String, completion: @escaping (Data?, Error?)-> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func request(urlSring: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlSring) else {
            return
        }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
}

