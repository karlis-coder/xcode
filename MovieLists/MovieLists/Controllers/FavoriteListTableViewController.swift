//
//  FavoriteListTableViewController.swift
//  MovieLists
//
//  Created by Karlis Butins on 05/02/2021.
//

import UIKit

class FavoriteListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.shared.favoriteFilteredMovies().count
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteListCell", for: indexPath)

        // Configure the cell...
    /*    cell.textLabel?.text = titleList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = titleList[indexPath.row]
        cell.imageView?.image = UIImage(named: titleList[indexPath.row])
    */
        
        let movie = DataManager.shared.favoriteFilteredMovies()[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.year
        cell.imageView?.image = UIImage(named: movie.poster)
        cell.imageView?.contentMode = .scaleToFill
        
        
        let button = UIButton()
        
      
        button.isSelected = true
        
            button.setImage(UIImage(systemName: "star.fill"), for: .selected)
        
            button.setImage(UIImage(systemName: "star"), for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        cell.accessoryView = button
        
        return cell
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let favoriteIndex = sender.tag
        if DataManager.shared.favoriteMovies.contains(favoriteIndex) {
            DataManager.shared.favoriteMovies.remove(favoriteIndex)
        }else{
            DataManager.shared.favoriteMovies.insert(favoriteIndex)
        }
        
        tableView.reloadData()
        
    }
    
    //MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        //DataManager.shared.favoriteFilteredMovies().insert(currentTitle, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.none
        
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            print("indexPath.row: ", indexPath.row)
        // Get the new view controller using segue.destination.
            let detailVC = segue.destination as! DetailViewController
        // Pass the selected object to the new view controller.
            //detailVC.movie = movies[indexPath.row]
        }
    }

}
