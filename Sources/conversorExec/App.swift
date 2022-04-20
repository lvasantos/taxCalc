//
//  File.swift
//  
//
//  Created by Luciana Adrião on 22/03/22.
//

import Foundation
import conversor

@main
public struct App {
    
    public static func main() async {
    
        entryAscii()
        
        if let input = Double(readLine()!){
            
            try await Conversor().convertBRLToCurrencies(inputDouble: input)
            
        }else{
            
            print("[ENTRADA INVALIDA]\n\nSaindo...☹️")
            
        }
    }
}

