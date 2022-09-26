//
//  Places.swift
//  PlacesApp
//
//  Created by Esteban SEMELLIER on 26/09/2022.
//

import Foundation

struct Places: Identifiable, Decodable {
    var id: Int
    var name: String
    var lat: Double
    var lon: Double
    var address: String
    var type: String
    var url: String
    var wifi: Bool
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: "places.json", withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

var places: [Places] = load("places.json")




