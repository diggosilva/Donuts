class DetailViewController: UIViewController {
    
    // MARK: - Initialize DetailView
    
    let detailView = DetailView()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
    }
    
    // MARK: - UI Setup
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
