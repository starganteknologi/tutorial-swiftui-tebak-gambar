//
//  ContentView.swift
//  tebakgambar
//
//  Created by fathur rohman on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebon" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"].shuffled()
    var jawabanBenar = Int.random(in: 0...2)
    @State private var tampilkanSkor = false
    @State private var judulSkor = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap batik motif")
                        .foregroundColor(.white)
                    Text(gambarBatik[jawabanBenar])
                        .foregroundColor(.white)
                }
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                    } label: {
                        Image(gambarBatik[number])
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
