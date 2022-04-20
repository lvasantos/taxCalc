import Foundation

public class Conversor {
    
    public typealias CurrencyBuyPrice = (USD: Double, EUR: Double)
    
    //percents for the trade USD -> BRL
    let variableTaxPercent = 0.064 //Percent
    let fixedTaxForUSD = 0.60 //USD
//    var response: Response? = nil
    
    public init() { }
    
    public func getFromHTML() async -> Response?  {
        let url = URL(string: "https://api.hgbrasil.com/finance")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
    
    
        public func getCurrencyBuyPrice() async -> CurrencyBuyPrice? {
            if let response = try await getFromHTML() {
                let USD = response.results.currencies.usd.buy
                let EUR = response.results.currencies.eur.buy
    

                return (USD, EUR)
            }
            print("Error GetCurrency")
            return nil
        }
    
        public func convertBRLToCurrencies(inputDouble: Double) async {
                guard let currencyPrice = try await getCurrencyBuyPrice() else{return print("erro")}
                let BRLToUSDValue = inputDouble / currencyPrice.USD
                let variableTaxCalculation = BRLToUSDValue * variableTaxPercent
                let USDCharge   = String(format: "%.2f", BRLToUSDValue + fixedTaxForUSD + variableTaxCalculation)
    
                outputAscii(USDCharge, variableTaxCalculation, fixedTaxForUSD)
    
            }
    
}


