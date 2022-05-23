//
//  MapScreen.swift
//  macOSINT
//
//  Created by Mohammad Azam on 12/24/21.
//

import SwiftUI

struct MapScreen: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        MapView(annotations: appState.places, selectedPlace: appState.selectedPlace)
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
