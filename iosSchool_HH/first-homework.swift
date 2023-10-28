import Foundation

struct Location {
    let id: Int
    let name: String
    let type: String
    let demestion: String
    let residents: [String]
}

struct LocationsList {
    let info: Info
    let result: [Location]

    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}

class Character {
    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    enum Gender: String, CaseIterable {
        case female
        case male
        case genderless
        case unknown
    }

    enum Status: String, CaseIterable {
        case alive
        case dead
        case unknown
    }

    init(id: Int,
         name: String,
         species: String,
         image: String,
         url: String,
         episode: [String],
         gender: Gender,
         status: Status) {
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

class CharacterGenerator: Character {

    func generateCharacter() -> Character {
        let randomGender = Gender.allCases.randomElement() ?? .unknown
        let randomStatus = Status.allCases.randomElement() ?? .unknown
        let someCharacter = Character(
            id: Int.random(in: 0...1000),
            name: "Character \(id)",
            species: "Human",
            image: "Photo \(id)",
            url: "https://\(name).com",
            episode: ["1", "2", "3"],
            gender: randomGender,
            status: randomStatus)
        return someCharacter
    }
}
