//
//  ContentView.swift
//  tebakgambar
//
//  Created by fathur rohman on 14/04/22.
//

import SwiftUI

struct ContentView: View {
    var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebot" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"]
    var body: some View {
        Image("kawung-jateng")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
