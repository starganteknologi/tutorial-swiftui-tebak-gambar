//
//  ContentView.swift
//  tebakgambar
//
//  Created by fathur rohman on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    let gradient1 = Gradient(colors: [.black, .blue])
    let gradient2 = Gradient(colors: [.black, .blue, .yellow])
    let gradient3 = Gradient(stops: [.init(color: .black, location: 0),
                                      .init(color: .red, location: 0.5)
    ])
    @State private var tampilkanPeringatan: Bool = false
    var body: some View {
        VStack {
            
            ZStack(alignment: .top) {
                Color(red: 0.1, green: 0.5, blue: 0.7)
                VStack {
                    Spacer().frame(width: .infinity, height: 50)
                    HStack {
                        Text("Hello, world!")
                            .padding()
                        Text("Hello, Tengah!")
                            .padding()
                        Text("Hello, Depaan!")
                            .padding()
                    }
                    
                    VStack {
                        Rectangle()
                            .fill(
                                AngularGradient(gradient: gradient2, center: .center)
                            )
                    }.frame(width: 200, height: 200)
                    
                    VStack {
                        Button("click me", role: .destructive, action: klikme)
                    }
                    
                    VStack {
                        Button("Button 1") { }
                            .buttonStyle(.bordered)
                            .tint(.red)
                        Button("Button 2", role: .destructive) { }
                            .buttonStyle(.bordered)
                        Button("Button 3") { }
                            .buttonStyle(.borderedProminent)
                        Button("Button 4", role: .destructive) { }
                            .buttonStyle(.borderedProminent)
                        
                        Button {
                            print("Button was tapped")
                        } label: {
                            Text("Tap me!")
                                .padding()
                                .foregroundColor(.white)
                                .background(.red)
                        }
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Image(systemName: "pencil")
                        }
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("tampilkan peringatan"){
                            tampilkanPeringatan = true
                        } .alert("pesan penting", isPresented: $tampilkanPeringatan) {
                            Button("Hapus", role: .destructive) {}
                            Button("Cancel", role: .cancel) {}
                        } message: {
                            Text("Pastikan anda yakin dengan tombol yang dipilih")
                        }
                        .buttonStyle(.borderedProminent)
                            
                    }
                    
                }
                
            .background(.thinMaterial)
            }
            .ignoresSafeArea()
           
            
        }
        
        
    }
    
    func klikme() {
        print("tombol di klik")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
