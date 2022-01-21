//
//  CryptosDownloadService.swift
//  CurrencyConverter
//
//  Created by Alican Kurt on 17.01.2022.
//

import Foundation

protocol CryptosDownloadProtocol{
    func getCryptosFromJSON(completion: @escaping (Result<[CurrencyModel], Error>)-> Void)
}


struct CryptosDownload: CryptosDownloadProtocol{
    
    func getCryptosFromJSON(completion: @escaping (Result<[CurrencyModel], Error>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else{
            completion(.failure(CrpytoDownloadErrors.FailedToDownloadData))
            return
        }
        DispatchQueue.main.async {
            let cryptoDownloadTask = URLSession.shared.dataTask(with: url) { data , response , error  in
                guard error == nil, let data = data else{
                    completion(.failure(CrpytoDownloadErrors.FailedToDownloadData))
                    return
                }
                do{
                    let cryptoArray = try JSONDecoder().decode([CurrencyModel].self, from: data)
                    completion(.success(cryptoArray))
                }catch{
                    completion(.failure(CrpytoDownloadErrors.FailedToParsingData))
                }
            }            
            cryptoDownloadTask.resume()
        }
    }
    
}

enum CrpytoDownloadErrors : Error{
    case FailedToDownloadData
    case FailedToParsingData
}
