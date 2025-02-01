class FeedView: UIView {
    lazy var collectionCategory: UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let screenWidth = (UIScreen.main.bounds.width - 50) / 4
        layout.itemSize = CGSize(width: screenWidth, height: 80)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FeedCellCategory.self, forCellWithReuseIdentifier: FeedCellCategory.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func imgTapped(sender: UITapGestureRecognizer) {
        guard let imgView = sender.view as? UIImageView else { return }
        print("Tocou na imagem com tag: \(imgView.tag)")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = .systemBackground
        addSubviews([collectionCategory])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionCategory.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionCategory.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionCategory.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionCategory.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}