//
//  CurrencyListViewModel.swift
//  CurrencyConverter
//
//  Created by Alican Kurt on 17.01.2022.
//

import Foundation

class CurrencyListViewModel: ObservableObject{
    
    @Published var currencies = [CurrencyModel]()
    let cryptosDownloadService : CryptosDownloadProtocol = CryptosDownload()
    
    func getCurrencies(){
        cryptosDownloadService.getCryptosFromJSON {[weak self] result  in
            switch result{
            case .success(let cryptoArr):
                DispatchQueue.main.async {
                    self?.currencies = cryptoArr
                }                 
                //print(cryptoArr)
            case .failure(let error):
                print("Error: \(error)")              
            }
        }
    }
    
}
