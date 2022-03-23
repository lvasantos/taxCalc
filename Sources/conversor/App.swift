//
//  File.swift
//  
//
//  Created by Luciana Adrião on 22/03/22.
//

import Foundation

public class App {
    public func main(){
    //        Data input
        let conversor = Conversor()

        print(
            """
            ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            
                      |￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|
                                 ᴄᴀʟᴄᴜʟᴇ
                                ꜱᴜᴀ ᴛᴀxᴀ 💰
                      |＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿|
                          ⠀(\\__/) ||
                     ⠀⠀⠀⠀⠀⠀(•ㅅ•) ||
                      ⠀⠀⠀⠀⠀⠀/ 　 づ
            ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            
            """)
        
        print("Insira o valor que você quer receber em reais: ", terminator: "")
        
        if let input = Double(readLine()!){
            conversor.outAns(inputDouble: input)
        }else{
            print("[ENTRADA INVALIDA]\n\nSaindo...☹️")
        }
    }
}

