//
//  ViewController.swift
//  Earthquake
//
//  Created by Balazs Agnes on 04.08.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {
   
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var net = Networking()
    var data : [EarthquakeModel] = []

  
    override func viewDidLoad() {
        super.viewDidLoad()
        net.delegate = self
        tableView.dataSource = self
       
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        net.perform()
     
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CustomCell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
       

            cell.flagImage?.image = UIImage(systemName: "flag")
            cell.titleLabel.text = String(data[indexPath.row].location)
            cell.locationLabel.text = data[indexPath.row].place
            cell.magLabel.text = String(data[indexPath.row].strength)
            cell.timeLabel.text = String(data[indexPath.row].timeInMilliseconds)
       
            
        print(data[indexPath.row].date)
        print(data[indexPath.row].strength)
         
        return cell
    
    }
}

extension ViewController: NetworkingDelegate{
    func updateUI(datalist: [EarthquakeModel]) {
        data = datalist
        tableView.reloadData()
        print(datalist.count)
    }
    
    func handleErrors(error: Error) {
        print("There's an error")
    }
}
