class DonutCell: UICollectionViewCell {
    static let identifier = "DonutCell"
    
    lazy var bgPrice: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        bg.layer.cornerRadius = 20
        bg.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner] // Apenas os cantos inferior esquerdo e superior direito
        return bg
    }()
    
    lazy var labelPrice: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$4.99"
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.8
        return lbl
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "dog.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nuts Caramel"
        lbl.font = .systemFont(ofSize: 12, weight: .semibold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var companyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Dunkin's"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "heart")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.label, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(model: DonutModel) {
        labelPrice.text = "$\(model.price)"
        
        nameLabel.text = model.name.capitalized
        self.backgroundColor = .systemGreen.withAlphaComponent(0.1)
        self.layer.cornerRadius = 20
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews([bgPrice, labelPrice, image, nameLabel, companyLabel, likeButton, addButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgPrice.topAnchor.constraint(equalTo: topAnchor),
            bgPrice.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgPrice.widthAnchor.constraint(equalToConstant: 70),
            bgPrice.heightAnchor.constraint(equalToConstant: 35),
            
            labelPrice.centerXAnchor.constraint(equalTo: bgPrice.centerXAnchor),
            labelPrice.centerYAnchor.constraint(equalTo: bgPrice.centerYAnchor),
            labelPrice.leadingAnchor.constraint(equalTo: bgPrice.leadingAnchor, constant: 5),
            labelPrice.trailingAnchor.constraint(equalTo: bgPrice.trailingAnchor, constant: -5),
            
            image.topAnchor.constraint(equalTo: bgPrice.bottomAnchor, constant: 10),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 60),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            addButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}