import Foundation

struct Location {
    let id: Int
    let name: String
    let type: String
    let demestion: String
    let residents: [String]
}

struct LocationsList {
    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let result: [Location]
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
    let generateNameTwoClosure: () -> String = {
        return String(Int.random(in: 0...1000))
    }

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
      return {
            print("Character \(Int.random(in: 0...1000))")
        }
    }

    func generateNameFour() -> (() -> String) {
            return { "Character \(Int.random(in: 0...1000))" }
        }
}
