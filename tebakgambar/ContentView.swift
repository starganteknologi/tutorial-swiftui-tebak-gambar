//
//  ContentView.swift
//  tebakgambar
//
//  Created by fathur rohman on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebon" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"].shuffled()
    @State private var jawabanBenar = Int.random(in: 0...2)
    @State private var tampilkanSkor = false
    @State private var judulSkor = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [ .green, .black ]), startPoint: .top, endPoint: .bottom)
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
                        batikTapped(number)
                    } label: {
                        Image(gambarBatik[number])
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
        .alert(judulSkor, isPresented: $tampilkanSkor) {
            Button("Lanjut", action: acakGambar)
        } message: {
            Text("Skor kamu adalah ???")
        }
    }
    
    func batikTapped(_ angka: Int) {
        if angka == jawabanBenar {
            judulSkor = "Benar"
        } else {
            judulSkor = "Salah"
        }

        tampilkanSkor = true
    }
    
    func acakGambar() {
      gambarBatik = gambarBatik.shuffled()
      jawabanBenar = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
