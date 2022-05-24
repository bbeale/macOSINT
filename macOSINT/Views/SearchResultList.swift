//
//  SearchResultList.swift
//  macOSINT
//
//  Created by BLSEC on 5/22/22.
//

import SwiftUI

struct SearchResultList: View {
    
    let places: [PlaceAnnotation]
    var onSelect: (PlaceAnnotation) -> Void
    
    @StateObject private var locationManager = LocationManager()
    @AppStorage("distanceUnit") var distanceUnit: DistanceUnit = .miles
    
    private var distanceFormatter = DistanceFormatter()
    
    init(places: [PlaceAnnotation], onSelect: @escaping (PlaceAnnotation) -> Void) {
        self.places = places
        self.onSelect = onSelect
    }
    
    func formatDistance(for place: PlaceAnnotation) -> String {
        guard let distanceInMeters = place.getDistance(userLocation: locationManager.location) else {
            return ""
        }
        distanceFormatter.unitOptions = distanceUnit
        return distanceFormatter.format(distInMeters: distanceInMeters)
    }
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                Text(place.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(place.address)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(formatDistance(for: place))
                    .font(.caption)
                    .opacity(0.4)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect(place)
            }
        }
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList(places: [], onSelect: { _ in })
    }
}
