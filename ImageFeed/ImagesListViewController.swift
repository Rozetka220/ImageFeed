import UIKit

class ImagesListViewController: UIViewController {
    
    let table = UITableView()
    var cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    let image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTable()
        configureCell()
        
        table.delegate = self
        table.dataSource = self
    }
    
    func configureView(){
        view.backgroundColor = UIColor(named: "YPBlack")
    }
    
    func configureTable(){
        view.addSubview(table)
        table.backgroundColor = UIColor(named: "YPBlack")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func configureCell(){
        cell.backgroundColor = UIColor(named: "YPBlack")
        //не получилось закруглить ячейку, закруглил пикчу
    }
    
    func configureImage(){
        cell.addSubview(image)
        image.image = UIImage(named: "0")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") { // 2
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")        // 3
        }
        
        configureCell()
        configureImage()
        //cell.imageView?.image =                          // 4
        
        return cell
    }
    
    
}

