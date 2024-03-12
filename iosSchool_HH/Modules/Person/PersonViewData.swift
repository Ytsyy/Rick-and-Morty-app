
import UIKit

struct PersonViewData {
    let photoCellData: PersonPhotoCellData
    let episodeData: [PersonEpisodeCellData]
    let episodeHeader: PersonHeaderViewData

    init(image: UIImage?, episodesUrls: [String]) {
        photoCellData = PersonPhotoCellData(image: (image ?? UIImage(named: "character-placeholder")) ?? UIImage())
        episodeData = episodesUrls.compactMap { PersonEpisodeCellData(url: $0) }
        episodeHeader = PersonHeaderViewData()
    }
}
