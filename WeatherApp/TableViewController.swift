//
//  TableViewController.swift
//  WeatherApp
//
//  Created by Ashish on 10/17/19.
//  Copyright © 2019 Ashish. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON


class TableViewController: UITableViewController {

    var arr = [Weather]()
    override func viewDidLoad() {
        super.viewDidLoad()

//         do{
//            let realm = try Realm()
//        }catch{
//            print("Error in initializing \(error)")
//        }

//        print(Realm.Configuration.defaultConfiguration.fileURL)
//


    }

    func AddWeatherToDB(weather: Weather){
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(weather, update: Realm.UpdatePolicy.all)
            }

        }catch{
            print("Error in Adding weather to DB \(error)")
        }
    }
    
    func LoadValuesFromDB(){
           do{
               let realm = try! Realm()
               let weathers = realm.objects(Weather.self)
               for weather in weathers{
                   arr.append(weather)
               }
           }catch{
               
           }
           
           
       }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.lblCityName.text = "\(arr[indexPath.row].cityname )"
        cell.lblHigh.text = "\(arr[indexPath.row].high )"
        cell.lblLow.text = "\(arr[indexPath.row].low )"
        
        return cell
    }
    


}
