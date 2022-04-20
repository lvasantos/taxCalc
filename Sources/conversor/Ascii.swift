//
//  File.swift
//  
//
//  Created by Luciana Adrião on 19/04/22.
//
public func entryAscii(){
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
}

func outputAscii(_ valorFinalUsd: String, _ taxaVariavel: Double, _ taxaFixa:Double){
    print("""
        //
        //              ＿＿     /￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣/
        //　　　　　／＞　　  フ     Invoice de: $\(valorFinalUsd)
        //　　　　　| 　_   _|  <＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿/
        //　 　　　／` ミ＿xノ
        //　　 　 /　　　 　 |
        //　　　 /　 ヽ　　 ﾉ    <￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣/
        //　 　 │　　 |　|　|    /   Perde $\(String(format:"%.2f",  taxaVariavel + taxaFixa)) em taxas
        //　／￣|　　 |　|　|   /＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿/
        //　| (￣ヽ＿_ヽ_)__)
        //　＼二つ
        //
        """)
}
