import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gitCommitsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeApiCall()
        self.gitCommitsTableView.register(UINib(nibName: "GitCommitsTableViewCell", bundle: nil), forCellReuseIdentifier: "GitCommitsTableViewCell")
    }

    func makeApiCall() {

        var request = URLRequest(url: URL(string: Constants.GitUrl)!)
           request.httpMethod = "GET"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")

           let session = URLSession.shared
           let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
               print(response!)
               do {
               // let json = try JSONSerialization.jsonObject(with: data!) as! Array Dictionary<String, AnyObject>
                  // print(json["data"])
               } catch {
                   print("error")
               }
           })

           task.resume()
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

