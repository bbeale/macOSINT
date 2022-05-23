//
//  HomeScreen.swift
//  macOSINT
//
//  Created by Mohammad Azam on 12/24/21.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBar()
                .frame(minWidth: 300)
            MapScreen()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
