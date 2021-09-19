import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gitCommitsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.gitCommitsTableView.register(UINib(nibName: "GitCommitsTableViewCell", bundle: nil), forCellReuseIdentifier: "GitCommitsTableViewCell")

    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           4
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GitCommitsTableViewCell", for: indexPath) as? GitCommitsTableViewCell else {fatalError("unable to load the cell")}
        return cell
       }
       

}

