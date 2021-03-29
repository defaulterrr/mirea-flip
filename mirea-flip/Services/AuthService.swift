//
//  AuthService.swift
//  mirea-flip
//
//  Created by defaulterrr on 29.03.2021.
//

import Foundation
import Combine

final class AuthService {
    func fetchLogin(_ email: String, _ password: String) -> AnyPublisher<ResponseContainer, Error> {
        
        let url = URL(string: "http://localhost:8080/auth/login")
        var request = URLRequest(url: url!)
        try! request.httpBody = JSONEncoder().encode(User(email: "test@gmail.com", password: "123"))
        request.httpMethod = "POST"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map {$0.data}
            .decode(type: ResponseContainer.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct User: Encodable {
    var email: String
    var password: String
}

struct ResponseContainer: Decodable {
    var token: String
}
