import UIKit

final class HeaderCell: UITableViewHeaderFooterView {
    
    static let reuseIidentifier = "HeaderCell"
    
    private var stackView = UIStackView()
    private var instrumentLabel = UILabel()
    private var priceLabel = UILabel()
    private var amountLabel = UILabel()
    private var sideLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupAllViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        setupAllViews()
//    }
    
    private func setupAllViews() {
        setupStackView()
        setupLabels()
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
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    private func setupLabels() {
        let titles = ["Instruments", "Price", "Amount", "Side"]
        [instrumentLabel, priceLabel, amountLabel, sideLabel].enumerated().forEach {
            $1.translatesAutoresizingMaskIntoConstraints = false
            $1.textAlignment = .center
            $1.text = titles[$0]
            $1.font = UIFont(name: "Arial", size: 13)
            $1.textColor = .black
            stackView.addArrangedSubview($1)
        }
    }
}
