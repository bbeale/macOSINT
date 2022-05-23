//
//  SideBar.swift
//  macOSINT
//
//  Created by Mohammad Azam on 12/24/21.
//

import SwiftUI

struct SideBar: View {
    
    private var vm = SearchResultsViewModel()
    @State private var search: String = ""
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            SearchResultList(places: appState.places) { place in
                appState.selectedPlace = place
                print(place)
            }
        }.searchable(text: $search, placement: .sidebar, prompt: "Search Maps")
            .onChange(of: search, perform: { value in
                vm.search(text: value) { places in
                    appState.places = places
                }
            })
            .padding()
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
