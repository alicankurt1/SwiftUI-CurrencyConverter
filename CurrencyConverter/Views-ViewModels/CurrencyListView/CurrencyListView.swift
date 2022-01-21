//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Alican Kurt on 17.01.2022.
//

import SwiftUI

struct CurrencyListView: View {
    
    @StateObject var currencyListViewModel: CurrencyListViewModel
    
    init(currencyListViewModel: CurrencyListViewModel = .init()){
        _currencyListViewModel = StateObject(wrappedValue: currencyListViewModel)
    }
    
    @State private var selectedIndex = 0
    
    
    var body: some View {
            
            List(currencyListViewModel.currencies){ currency in
                VStack{
                    Text(currency.currency)
                    Text(currency.price)
                }
            }
            .onAppear(perform: currencyListViewModel.getCurrencies)
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCurrencies = CurrencyModel(currency: "Bitcoin", price: "000.111")
        let dummyViewModel = CurrencyListViewModel()
        dummyViewModel.currencies = [dummyCurrencies]
        return CurrencyListView(currencyListViewModel: dummyViewModel)
    }
}
