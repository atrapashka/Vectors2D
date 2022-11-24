
import UIKit

class CustomVectorListCell: UICollectionViewCell {
    
    static let identifier = "CustomVectorListCell"
    
    private var vectorNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemPink
        
        vectorNameLabel.textAlignment = .center
        vectorNameLabel.frame = CGRect(x: 0,
                                       y: 0,
                                       width: contentView.bounds.width,
                                       height: contentView.bounds.height / 4)
        contentView.addSubview(vectorNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(vectorName: String) {
        vectorNameLabel.text = "\(vectorName)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vectorNameLabel.text = nil
    }
}
