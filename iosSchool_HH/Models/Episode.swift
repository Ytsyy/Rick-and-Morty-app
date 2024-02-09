import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
    }
}
