//
//  SearchResultsViewModel.swift
//  macOSINT
//
//  Created by BLSEC on 5/22/22.
//

import Foundation
import MapKit

class SearchResultsViewModel {
    
    private var locationManager = LocationManager()
    
    func search(text: String, completion: @escaping ([PlaceAnnotation]) -> Void) {
        if text.count < 4 {
            // i don't like this
            completion([])
            return
        }
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = locationManager.region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            let places = response.mapItems.map(PlaceAnnotation.init)
            completion(places)
        }
    }
}
