
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
    let usd, eur: Ars

    enum CodingKeys: String, CodingKey {
        case source
        case usd = "USD"
        case eur = "EUR"
        
    }
}

//MARK: - Ars
public struct Ars: Codable {
    let name: String
    let buy: Double
    let sell: Double?
    let variation: Double
}
