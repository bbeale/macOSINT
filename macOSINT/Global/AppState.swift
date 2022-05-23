//
//  AppState.swift
//  macOSINT
//
//  Created by BLSEC on 5/22/22.
//

import Foundation

class AppState: ObservableObject {
    @Published var places: [PlaceAnnotation] = []
    @Published var selectedPlace: PlaceAnnotation?
    // todo: implement these.....
    //@Published var tweets: [TweetAnnotation] = []
    //@Published var fbVideos: [FbVideoAnnotation] = []
    //@Published var instagPosts: [InstaGPostAnnotation] = []
}
