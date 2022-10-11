//
//  CatBreedTableViewCell.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {
    static let reuseIdentifer: String = "CatBreedTableViewCell"
    @IBOutlet weak var catBreedTitle: UILabel!
    @IBOutlet weak var catImageView: CustomImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(catBreed: CatBreedResponse) {
        catBreedTitle.text = catBreed.categories[0].name
        guard let url = URL(string: catBreed.url ?? "") else { return }
        catImageView.getImage(with: url)
    }
    
}
