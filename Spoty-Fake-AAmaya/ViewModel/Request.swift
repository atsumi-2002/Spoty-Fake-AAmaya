//
//  Request.swift
//  Spoty-Fake-AAmaya
//
//  Created by MAC05 on 4/06/22.
//

import Foundation

class Request {
    
    let token = "BQCiKcxI0C14k8lfVzKCKph6jynJcxdt-C8bOSs618tjwkly5m00WBMGkHM4seoprdi1FVL7k5IWaUp3e0fLmLZMuKIJ4Vh-vQcmUwGqBerakFmWNLfF91OdAROMEUxoM56pbJjJLXydx-yr_vfuBwk1YsgLJ6mNeCo"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data? {
        do {
            let urlParse = url.replacingOccurrences(of: " ", with: "%20")
            var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(urlParse)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        } catch {
            return nil
        }
    }
    
}
