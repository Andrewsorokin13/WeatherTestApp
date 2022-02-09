//
//  NetworkDataFetch.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 08.02.2022.
//

import Foundation

// MARK: Network Protocol
protocol NetworkDataFetchProtocol {
    func fetchGenericJSON< T: Decodable >(urlString: String, response: @escaping (T?) -> Void )
}


class NetworkDataFetch: NetworkDataFetchProtocol {
    
    // MARK: Private property
    private var networking: NetworkServiceProtocol
    
    // MARK: Init
    init(networking: NetworkServiceProtocol = NetworkService() ){
        self.networking = networking
    }
 
    // MARK: Func
    func fetchGenericJSON<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        networking.request(urlSring: urlString) { (data, error) in
            if let error = error {
                print("Ошибка при запросе данных \(error.localizedDescription)")
                response(nil)
            }
            let decode = self.decodeJSONData(type: T.self, from: data)
            response(decode)
        }
    }
     func decodeJSONData<T: Decodable>(type: T.Type , from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {
            return nil
        }
        do {
            let modelObject = try decoder.decode(type.self, from: data)
            return modelObject
        } catch let decodeError {
            print("Нe получилось декодировать JSON ", decodeError)
            return nil
        }
    }

}
