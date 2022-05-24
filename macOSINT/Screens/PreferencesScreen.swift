//
//  PreferencesScreen.swift
//  macOSINT
//
//  Created by BLSEC on 5/23/22.
//

import SwiftUI

struct PreferencesScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false
    @AppStorage("distanceUnit") var distanceUnit = DistanceUnit.miles

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Toggle(isOn: $useLightMap) {
                Text("Always use light mode")
            }
            
            Divider()
            
            HStack {
                Text("Distance Units")
                Picker("", selection: $distanceUnit) {
                    ForEach(DistanceUnit.allCases, id: \.self) { distance in
                        Text(distance.title)
                    }
                }.fixedSize()
                    .padding(.trailing, 20)
            }
            
            Text("Preferences View")
        }.padding()
            .frame(minWidth: 400)
   }
}

struct PreferencesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesScreen()
    }
}
