class DetailView: UIView {
    
    // MARK: - Views
    lazy var bgImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .secondarySystemBackground
        return img
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "donut")
        return img
    }()
    
    lazy var bgInfo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.layer.cornerRadius = 50
        return img
    }()
    
    lazy var titleLabel = buildLabel(text: "Informações Nutricionais", font: .systemFont(ofSize: 16, weight: .semibold))
    
    // MARK: - Nutritional Info Views
    lazy var proteinLabel = buildLabel(text: "Proteína", font: .systemFont(ofSize: 10, weight: .semibold))
    lazy var proteinResultLabel = buildLabel(textColor: .gray, font: .italicSystemFont(ofSize: 10))
    lazy var vStack1 = createStack(arrangedSubviews: [proteinLabel, proteinResultLabel])
    
    lazy var caloriesLabel = buildLabel(text: "Calorias", font: .systemFont(ofSize: 10, weight: .semibold))
    lazy var caloriesResultLabel = buildLabel(textColor: .gray, font: .italicSystemFont(ofSize: 10))
    lazy var vStack2 = createStack(arrangedSubviews: [caloriesLabel, caloriesResultLabel])
    
    lazy var carbLabel = buildLabel(text: "Carboidrato", font: .systemFont(ofSize: 10, weight: .semibold))
    lazy var carbResultLabel = buildLabel(textColor: .gray, font: .italicSystemFont(ofSize: 10))
    lazy var vStack3 = createStack(arrangedSubviews: [carbLabel, carbResultLabel])
   
    lazy var hStack = createStack(arrangedSubviews: [vStack1, vStack2, vStack3], axis: .horizontal, distribution: .fillEqually)
    
    // MARK: - Description Views
    lazy var detailsLabel = buildLabel(text: "Detalhes", font: .systemFont(ofSize: 16, weight: .semibold))
    lazy var descriptionLabel = buildLabel(font: .systemFont(ofSize: 12, weight: .regular), numberOfLines: 0)
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(model: DonutModel) {
        guard let url = URL(string: model.imageURL) else { return }
        image.sd_setImage(with: url)
        proteinResultLabel.text = "\(model.protein)"
        caloriesResultLabel.text = "\(model.calories)"
        carbResultLabel.text = "\(model.carb)"
        descriptionLabel.text = model.donutDescription
        bgImage.backgroundColor = DSColor.colorsForTypes(type: model.id).withAlphaComponent(0.1)
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = .white
        addSubviews([bgImage, image, bgInfo, titleLabel, hStack, detailsLabel, descriptionLabel])
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        let screenHeight = (UIScreen.main.bounds.height) / 1.75
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImage.heightAnchor.constraint(equalToConstant: screenHeight),
            
            image.centerXAnchor.constraint(equalTo: bgImage.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: bgImage.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            bgInfo.topAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: -50),
            bgInfo.leadingAnchor.constraint(equalTo: bgImage.leadingAnchor),
            bgInfo.trailingAnchor.constraint(equalTo: bgImage.trailingAnchor),
            bgInfo.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: bgInfo.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: padding),
        ])
            
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            hStack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            hStack.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: padding),
            detailsLabel.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: detailsLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: detailsLabel.trailingAnchor),
        ])
    }
}
