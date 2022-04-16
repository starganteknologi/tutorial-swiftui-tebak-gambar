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
    @State private var skor = 0
    @State private var pertanyaanKe = 0
    @State private var isiAlert = ""
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Tebak Motif batik")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap batik motif")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(gambarBatik[jawabanBenar])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            batikTapped(number)
                        } label: {
                            Image(gambarBatik[number])
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .shadow(color:.black, radius: 10,x: 10, y: 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Skor: \(skor)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
        }
        .alert(judulSkor, isPresented: $tampilkanSkor) {
            Button("Lanjut", action: acakGambar)
        } message: {
            Text(isiAlert)
        }
    }
    
    func batikTapped(_ angka: Int) {
        if angka == jawabanBenar {
            judulSkor = "Benar"
            skor += 1
            isiAlert = "Skor kamu adalah \(skor)";
        } else {
            judulSkor = "Salah"
            isiAlert = "Motif yang kamu tap adalah \(gambarBatik[angka])"
        }

        tampilkanSkor = true
    }
    
    func acakGambar() {
        pertanyaanKe += 1
      gambarBatik = gambarBatik.shuffled()
      jawabanBenar = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
