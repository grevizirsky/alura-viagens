//
//  ContentView.swift
//  alura-viagens
//
//  Created by Ândriu Felipe Coelho on 03/02/20.
//  Copyright © 2020 Ândriu Felipe Coelho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        NavigationView{
            GeometryReader { view in
                
                VStack {
                    HeaderView()
                        .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 210 : 355, alignment: .top)
                    List(viagens) { viagem in
                        NavigationLink(
                            destination: MapaView(coordenada: viagem.localizacao).navigationBarTitle("Localicação")) {
                            CelulaViagemView(viagem: viagem)
                        }
                    }.navigationBarTitle("")
                }
            }
            .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
