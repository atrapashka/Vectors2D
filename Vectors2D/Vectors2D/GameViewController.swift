
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
//    let path = UIBezierPath()
    private var addVectorButton = UIButton()
    private var burgerButton = UIButton()
    private var menuView = UIView()
    private var listCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
            let skView = view as! SKView
            skView.presentScene(scene)
        
        scene.size = CGSize(width: view.bounds.width * 2,
                            height: view.bounds.height * 2)
        scene.backgroundColor = .darkGray
        
        setupUI()
        setupMenuView()
        setupCollectionView()
    }
    
    @objc private func onAddVectorButton() {
        print("To add vector screen")
        transitToScoreScreen()
    }
    
    @objc func onBurgerButton() {
        print(VectorManager.shared.pointsArray)
        if burgerButton.currentImage == UIImage(named: "burgerButton") {
            UIView.animate(withDuration: 0.5, delay: 0, options: []) { [self] in
                menuView.frame = CGRect(x: view.bounds.minY,
                                        y: view.bounds.minX,
                                        width: view.bounds.width / 3,
                                        height: view.bounds.height)
                burgerButton.alpha = 0
                burgerButton.setImage(UIImage(named: "closeButton"), for: .normal)
                burgerButton.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: []) { [self] in
                menuView.frame = CGRect(x: view.bounds.minX - view.bounds.width / 2,
                                        y: view.bounds.minY,
                                        width: view.bounds.width / 3,
                                        height: view.bounds.height)
                burgerButton.alpha = 0
                burgerButton.setImage(UIImage(named: "burgerButton"), for: .normal)
                burgerButton.alpha = 1
            }
        }
    }
    
    func transitToScoreScreen() {
        let storyboard = UIStoryboard.init(name: "AddVectorScreen", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! AddVectorScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .darkGray
        
        var addVectorButtonWidth: CGFloat = view.bounds.width / 6
        var addVectorButtonHeight = addVectorButtonWidth
        
        addVectorButton.frame = CGRect(x: view.bounds.midX - addVectorButtonWidth / 2,
                                       y: view.bounds.maxY - addVectorButtonHeight * 1.75,
                                       width: addVectorButtonWidth,
                                       height: addVectorButtonHeight)
        addVectorButton.backgroundColor = .systemPink
        addVectorButton.layer.cornerRadius = addVectorButtonHeight / 2
        addVectorButton.alpha = 0.8
        
        addVectorButton.setTitle("+", for: .normal)
        addVectorButton.titleLabel?.textAlignment = .center
        addVectorButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        
        addVectorButton.addTarget(self, action: #selector(onAddVectorButton), for: .touchUpInside)
        
        
        view.addSubview(addVectorButton)
        
        burgerButton.addTarget(self, action: #selector(onBurgerButton), for: .touchUpInside)
        burgerButton.setImage(UIImage(named: "burgerButton"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: burgerButton)
        
        view.addSubview(burgerButton)
    }
    
    private func setupMenuView() {
        menuView.frame = CGRect(x: view.bounds.minX - view.bounds.width / 2,
                                y: view.bounds.minY,
                                width: view.bounds.width / 3,
                                height: view.bounds.height)
        menuView.backgroundColor = .systemGray
        menuView.alpha = 0.8
        
        view.addSubview(menuView)
        
        let infoMenuViewLabel = UILabel()
        
        var widthValue: CGFloat = menuView.bounds.width
        var heightValue = widthValue / 3
        
        infoMenuViewLabel.frame = CGRect(x: menuView.bounds.midX - widthValue / 2,
                                         y: menuView.bounds.minY + widthValue / 1.5,
                                         width: widthValue,
                                         height: heightValue)
        infoMenuViewLabel.text = "Vectors:"
        infoMenuViewLabel.textAlignment = .center
        menuView.addSubview(infoMenuViewLabel)
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.scrollDirection = .vertical
        layoutFlow.itemSize = CGSize(width: menuView.bounds.width / 1.1,
                                     height: menuView.bounds.width / 2.5)
        let collectionViewWidth: CGFloat = menuView.bounds.width / 1.1
        let collectionViewHeight: CGFloat = menuView.bounds.height
        let collectionViewFrame = CGRect(x: menuView.bounds.midX - collectionViewWidth / 2,
                                         y: menuView.bounds.midY - collectionViewHeight / 3,
                                         width: collectionViewWidth,
                                         height: collectionViewHeight / 1.4)
        listCollectionView = UICollectionView(frame: collectionViewFrame,
                                              collectionViewLayout: layoutFlow)
        listCollectionView.register(CustomVectorListCell.self,
                                    forCellWithReuseIdentifier: CustomVectorListCell.identifier)
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
        listCollectionView.showsVerticalScrollIndicator = false
        listCollectionView.backgroundColor = .none
        
        menuView.addSubview(listCollectionView)
    }
}

extension GameViewController: UICollectionViewDelegate & UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomVectorListCell.identifier,
                                                      for: indexPath) as! CustomVectorListCell
        
        cell.configure(vectorName: "vectorName")
        
        return cell
    }
}
