//
//  ContentView.swift
//  tebakgambar
//
//  Created by fathur rohman on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebot" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"]
    var jawabanBenar = Int.random(in: 0...2)
    var body: some View {
        VStack {
                Text("Tap batik motif")
                Text(gambarBatik[jawabanBenar])
            }
        
        ForEach(0..<3) { number in
            Button {
               // flag was tapped
            } label: {
                Image(gambarBatik[number])
                    .renderingMode(.original)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
