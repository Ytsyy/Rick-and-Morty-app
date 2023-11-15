import Foundation

struct Location: Codable{
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dim: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case residents
        case dim = "dimention"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.residents = try container.decode([String].self, forKey: .residents)
        self.dim = try container.decode(String.self, forKey: .dim)
    }


}

class Character {
    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }

    enum Status: String, CaseIterable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    init(
        id: Int,
        name: String,
        species: String,
        image: String,
        url: String,
        episode: [String],
        gender: Gender,
        status: Status
    ) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }
}

protocol CharacterGeneratorProtocol {
    var characterCount: Int { get }

    func generateCharacter() -> Character
    func printCharacterInfo(character: Character)
}

class CharacterGenerator: CharacterGeneratorProtocol {
    var characterCount: Int = 0

    func generateCharacter() -> Character {
        let randomID = Int.random(in: 0...1000)
        let someCharacter = Character(
            id: randomID,
            name: "Character \(randomID)",
            species: "Human",
            image: "Photo \(randomID)",
            url: "https://Character\(randomID).com",
            episode: ["1", "2", "3"],
            gender: Character.Gender.allCases.randomElement() ?? .unknown,
            status: Character.Status.allCases.randomElement() ?? .unknown
        )
        characterCount += 1
        return someCharacter
    }

    func printCharacterInfo(character: Character) {
        print(character)
    }

    func generateNameOne(completion: (String) -> Void) {
        completion("Character  \(Int.random(in: 0...1000))")
    }

    func generateNameTwo(completion: () -> (String)) {
        print("Character: \(completion())")
    }

    func generateNameThree() -> () -> Void {
        {
            print("Character \(Int.random(in: 0...1000))")
        }
    }

    func generateNameFour() -> (() -> String) {
        {
            "Character \(Int.random(in: 0...1000))"
        }
    }
}
