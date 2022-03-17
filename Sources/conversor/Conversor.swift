import Foundation

class Luciana{

    
    func dolar() -> Double{
        
        let runLoop = CFRunLoopGetCurrent()
        var usdBuy = 0.0
        let url = URL(string: "https://api.hgbrasil.com/finance")!
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data {
                do{
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    usdBuy = response.results.currencies.usd.buy
                    CFRunLoopStop(runLoop)
                  
                    
                }catch {
                    print(error)
                }
            }
        }
        task.resume()
        CFRunLoopRun()
        return usdBuy
    }
    
    func app(){
        

//        -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


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
        
        let entradaDouble = Double(readLine(strippingNewline: true)!)
        print("Entrada inserida foi: \(entradaDouble!)")


//        Todos os valores em USD
        let valorDolar = dolar()
        let conversaoPUsd = entradaDouble! / valorDolar
        let taxaVariavel = conversaoPUsd * 0.064
        let taxaFixa = 0.60
        let valorFinalUsd = String(format: "%.2f", conversaoPUsd + taxaFixa + taxaVariavel)
        
        

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
//        -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
    }

}

// MARK: - Response
struct Response: Codable {
    let by: String
    let validKey: Bool
    let results: Results
    let executionTime: Int
    let fromCache: Bool

    enum CodingKeys: String, CodingKey {
        case by
        case validKey = "valid_key"
        case results
        case executionTime = "execution_time"
        case fromCache = "from_cache"
    }
}

// MARK: - Results
struct Results: Codable {
    
    let currencies: Currencies
    let availableSources: [String]

    enum CodingKeys: String, CodingKey {
        case currencies
        case availableSources = "available_sources"
    }
}

// MARK: - Currencies
struct Currencies: Codable {
    let source: String
    let usd, eur, gbp: Ars

    enum CodingKeys: String, CodingKey {
        case source
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
        
    }
}

struct Ars: Codable {
    let name: String
    let buy: Double
    let sell: Double?
    let variation: Double
}
