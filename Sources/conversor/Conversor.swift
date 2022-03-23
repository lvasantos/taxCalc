import Foundation

public class Conversor{

    public func dolar() -> Double{
        //makeRequest url, decode e map.
        
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
    
        public func outAns(inputDouble:Double){
            //Output, waiting better ideas.
            //        Todos os valores em USD
            let valorDolar      = dolar()
            let conversaoPUsd   = inputDouble / valorDolar
            let taxaVariavel    = conversaoPUsd * 0.064
            let taxaFixa        = 0.60
            let valorFinalUsd   = String(format: "%.2f", conversaoPUsd + taxaFixa + taxaVariavel)
            
            
            
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
        
    }


// MARK: - Response
public struct Response: Codable {
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
public struct Results: Codable {
    
    let currencies: Currencies
    let availableSources: [String]

    enum CodingKeys: String, CodingKey {
        case currencies
        case availableSources = "available_sources"
    }
}

// MARK: - Currencies
public struct Currencies: Codable {
    let source: String
    let usd, eur, gbp: Ars

    enum CodingKeys: String, CodingKey {
        case source
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
        
    }
}

//MARK: - Ars
public struct Ars: Codable {
    let name: String
    let buy: Double
    let sell: Double?
    let variation: Double
}
