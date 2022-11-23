//
//  CustomVectorListCell.swift
//  Vectors2D
//
//  Created by Alehandro on 23.11.22.
//

import UIKit

class CustomVectorListCell: UICollectionViewCell {
    
    static let identifier = "CustomVectorListCell"
    
    private var vectorNameLabel = UILabel()
//    private var temperatureLabel = UILabel()
//    private var weatherImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray4
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        vectorNameLabel.textAlignment = .center
        vectorNameLabel.frame = CGRect(x: 0,
                                       y: 0,
                                       width: contentView.bounds.width,
                                       height: contentView.bounds.height / 4)
        contentView.addSubview(vectorNameLabel)
//
//        temperatureLabel.textAlignment = .center
//        temperatureLabel.frame = CGRect(x: 0,
//                                        y: contentView.bounds.maxY - contentView.bounds.height / 4,
//                                        width: contentView.frame.width,
//                                        height: contentView.frame.height / 4)
//        contentView.addSubview(temperatureLabel)
//
//        weatherImage.contentMode = .scaleToFill
//        weatherImage.frame = CGRect(x: contentView.bounds.midX - contentView.bounds.width / 3,
//                                    y: contentView.bounds.midY - contentView.bounds.height / 3,
//                                    width: contentView.frame.width / 1.5,
//                                    height: contentView.frame.height / 1.5)
//        contentView.addSubview(weatherImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(vectorName: String) {
        vectorNameLabel.text = "\(vectorName)"
//        temperatureLabel.text = String(temperature)
//        weatherImage.image = UIImage(named: image)
//
//        if hoursLabel.text == "0" {
//            hoursLabel.text = "\(hours) ->"
//        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vectorNameLabel.text = nil
//        temperatureLabel.text = nil
//        weatherImage.image = nil
    }
}
