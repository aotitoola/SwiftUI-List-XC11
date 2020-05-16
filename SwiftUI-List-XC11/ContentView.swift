//
//  ContentView.swift
//  ListApp-XC11
//
//  Created by Aanuoluwa Otitoola on 16/05/2020.
//  Copyright © 2020 Aanuoluwa Otitoola. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let countryList: [Country] = [
        Country(id: 0, name: "Mozambique", population: 2000),
        Country(id: 1, name: "U.S.A", population: 400),
        Country(id: 2, name: "Cameroon", population: 5000),
        Country(id: 3, name: "Belgium", population: 6000),
        Country(id: 4, name: "Angola", population: 14000),
        Country(id: 5, name: "India", population: 1200)
    ]
    
    var names = ["Maria", "Alberto", "James", "Leandro",
                 "Georgina"]
    
    var body: some View {
        NavigationView{
            List(self.countryList, id: \.id) {
                country in
                NavigationLink(destination: Destination(country: country)){
                   CellRow(country: country)
                }.navigationBarTitle("Countries of the World!")
            }
        }
    }
}


struct CellRow: View {
    let country: Country
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(country.name)
                .bold().font(.title).foregroundColor(.gray)
            Text("Population: \(String(country.population))")
                .bold().font(.headline).italic()
                .foregroundColor(.pink)
        }
    }
}


struct Destination: View {
    let country: Country
    var body: some View {
        Text("\(country.name)'s Population is \(country.population)")
    }
}

struct Country: Identifiable {
    let id: Int
    let name: String
    let population: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

