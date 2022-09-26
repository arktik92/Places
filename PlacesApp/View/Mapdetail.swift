//
//  Mapdetail.swift
//  PlacesApp
//
//  Created by Esteban SEMELLIER on 26/09/2022.
//

import SwiftUI

struct Mapdetail: View {
    var place : Places
    var body: some View {
        
            ZStack {
                Image("resto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 550)
                    .blur(radius: 5)
                    .ignoresSafeArea()
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 200)
                        .foregroundColor(.gray)
                        .shadow(color: .black,radius: 10, x: 10, y: 10)
                        .overlay {
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Adresse: \(place.address)")
                                Text("Type: \(place.type)")
                                Spacer()
                                if !place.url.isEmpty {
                                    Link(destination: URL(string: place.url)!) {
                                        Text("Visit Website")
                                            .padding(10)
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                    }
                                }
                               
                                
                                
                            }
                            .padding()
                            .foregroundColor(.white)
                                .bold()
                        }
                    
                    
                   
        //            Link(destination: URL(string: place.url )!) {
        //                Text("Site Web")
        //            }
                    
                }
                
                
                
            }
            .toolbar(content: {
                HStack {
                    Text(place.name)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            })
    }
}

struct Mapdetail_Previews: PreviewProvider {
    static var previews: some View {
        Mapdetail(place: Places(id: 1, name: "df", lat: 0.0, lon: 0.0, address: "dfs", type: "dsf", url: "dsfq", wifi: false))
    }
}
