//
//  NetworkService.swift
//  MealHelper
//
//  Created by macbook Denis on 5/28/23.
//

import Foundation
import Alamofire

protocol INetworkService: AnyObject {
    func request<T: Codable, P: Encodable>(
        url: URLConvertible,
        method: HTTPMethod,
        parameters: P?,
        completion: @escaping (Result<(T, Int), Error>
        ) -> Void
    )
    
    func request<T: Codable>(
        url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters,
        completion: @escaping (Result<T, Error>
        ) -> Void
    )
}

final class NetworkService: INetworkService {
    static let shared: NetworkService = .init()
    
    // MARK: INetworkService
    
    func request<T: Codable, P: Encodable>(
        url: URLConvertible,
        method: HTTPMethod,
        parameters: P?,
        completion: @escaping (Result<(T, Int), Error>) -> Void
    ) {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let value):
                if let statusCode = response.response?.statusCode {
                    completion(.success((value, statusCode)))
                } else {
                    completion(.failure(NetworkError.missingStatusCode))
                }
            case .failure(let error):
                if let statusCode = error.responseCode {
                    completion(.failure(NetworkError.statusCode(statusCode)))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func request<T: Codable>(
        url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .responseDecodable { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
