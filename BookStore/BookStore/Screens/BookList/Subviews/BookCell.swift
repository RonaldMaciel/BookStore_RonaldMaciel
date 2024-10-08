//
//  Untitled.swift
//  BookStore
//
//  Created by Ronald on 28/09/24.
//

import UIKit
import Kingfisher

final class BookCell: UITableViewCell {
    
    // MARK: - Attributes
    public static let identifier: String = "BookCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appearSmoothly()
        selectionStyle = .none
    }
    
    // MARK: - Setup & Configuration
    func appearSmoothly() {
        contentView.alpha = 0
        
        UIView.animate(withDuration: 0.73) {
            self.contentView.alpha = 1
        }
    }
    
    func configure(with book: BookModel) {
        titleLabel.text = book.title
        if book.subtitle != nil {
            subtitleLabel.text = book.subtitle
        } else {
            subtitleLabel.text = book.description
        }
        
        let bookImageString = book.imageLinks?.smallThumbnail ?? ""
        let url = URL(string: bookImageString)
        thumbnailImageView.kf.setImage(with: url)
    }
}
