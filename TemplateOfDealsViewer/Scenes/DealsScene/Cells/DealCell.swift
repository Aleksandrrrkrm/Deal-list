import UIKit

class DealCell: UITableViewCell {
    
    static let reuseIidentifier = "DealCell"
    
    private var dateLabel = UILabel()
    private var stackView = UIStackView()
    private var instrumentLabel = UILabel()
    private var priceLabel = UILabel()
    private var amountLabel = UILabel()
    private var sideLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAllView() {
        setupDateLabel()
        setupStackView()
        setupParametersLabels()
    }
    
    private func setupDateLabel() {
        dateLabel.textColor = .gray
        dateLabel.text = "20.04.2021"
        dateLabel.font = UIFont(name: "Arial", size: 13)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor)
        ])
    }
    
    private func setupParametersLabels() {
        [instrumentLabel, priceLabel, amountLabel, sideLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
            $0.font = UIFont(name: "Arial", size: 15)
            $0.textColor = .black
            stackView.addArrangedSubview($0)
        }
    }
    
    func setupCell(_ deal: Deal) {
        
        let roundedPrice = (deal.price * 100).rounded() / 100
        let roundedAmount = deal.amount.rounded()

        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .decimal
        priceFormatter.minimumFractionDigits = 2

        let amountFormatter = NumberFormatter()
        amountFormatter.numberStyle = .decimal

        if let formattedPrice = priceFormatter.string(from: NSNumber(value: roundedPrice)),
           let formattedAmount = amountFormatter.string(from: NSNumber(value: roundedAmount)) {
            priceLabel.text = "\(formattedPrice)"
            amountLabel.text = "\(formattedAmount)"
        }
        
        instrumentLabel.text = deal.instrumentName
        sideLabel.text = "@@@"
        dateLabel.text = "\(deal.dateModifier)"
    }
}
