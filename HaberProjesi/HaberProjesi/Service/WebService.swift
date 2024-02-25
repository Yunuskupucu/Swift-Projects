//
//  WebService.swift
//  HaberProjesi
//
//  Created by Yunus Emre KÜPÜCÜ on 23.02.2024.
//

import Foundation

class WebService {
    
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                }
                
            }
        }.resume()
    }
    
}
