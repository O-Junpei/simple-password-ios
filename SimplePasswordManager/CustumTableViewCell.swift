import UIKit

class CustumTableViewCell: UITableViewCell {
    
    var iconImageView: UIImageView!
    var nameLabel: UILabel!
    var idLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        iconImageView.backgroundColor = .red
        contentView.addSubview(iconImageView)
        
        nameLabel = UILabel()
        // nameLabel.backgroundColor = .gray
        nameLabel.text = "秋月電気"
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        contentView.addSubview(nameLabel)
        
        idLabel = UILabel()
        // idLabel.backgroundColor = .orange
        idLabel.text = "snorlax.chemist.and.jazz@example.com"
        contentView.addSubview(idLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width
        let height = frame.height   // 8 + 32 + 8 + 24 + 8 = 80
        let margin: CGFloat = 8
        let accessoryMargin: CGFloat = 40
        
        let iconSize = CGSize(width: height - margin * 2, height: height - margin * 2)
        iconImageView.frame = CGRect(x: margin, y: margin, width: iconSize.width, height: iconSize.height)
        iconImageView.layer.cornerRadius = iconSize.width / 2
        
        let nameLabelSize = CGSize(width: width - (iconSize.width + margin * 2 + accessoryMargin), height: 32)
        nameLabel.frame = CGRect(x: iconSize.width + margin * 2, y: margin, width: nameLabelSize.width, height: nameLabelSize.height)
        
        let idLabelSize = CGSize(width: width - (iconSize.width + margin * 2 + accessoryMargin), height: 24)
        idLabel.frame = CGRect(x: iconSize.width + margin * 2, y: height - idLabelSize.height - margin, width: idLabelSize.width, height: idLabelSize.height)
    }
}
