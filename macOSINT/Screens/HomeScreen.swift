//
//  HomeScreen.swift
//  macOSINT
//
//  Created by Mohammad Azam on 12/24/21.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false

    var body: some View {
        NavigationView {
            Group {
                SideBar()
                    .frame(minWidth: 300)
                MapScreen()
            }.preferredColorScheme(useLightMap ? .light: .dark)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
