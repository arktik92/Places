//
//  SwiftUIView.swift
//  PlacesApp
//
//  Created by Esteban SEMELLIER on 26/09/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var overText: Bool = false
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.868143, longitude: 2.339605), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: places) { place in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon)) {
                    NavigationLink(destination: Mapdetail(place: place)) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .onHover { over in
                                overText = over
                            }
                        if overText {
                            Text(place.name)
                                .foregroundColor(.red)
                        }
                    }
                    
                }
                
            }
            .ignoresSafeArea()
        }.accentColor(.red)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
