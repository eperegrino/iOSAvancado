//
//  ConsolesTableViewController.swift
//  MyGames
//
//  Created by Douglas Frari on 11/30/19.
//  Copyright © 2019 CESAR School. All rights reserved.
//

import UIKit

class ConsolesTableViewController: UITableViewController {
    
    var label = UILabel()
    var consolesManager = ConsolesManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mensagem default
        label.text = "Você não tem plataformas cadastradas"
        label.textAlignment = .center
        
        let mainColor = UIColor(named: "second") ?? UIColor.red
        self.setUpStatusBarBackgroudColorWhenIOS13(color: mainColor)
        
        loadConsoles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    
    
    func loadConsoles() {
        consolesManager.loadConsoles(with: context)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = consolesManager.consoles.count
        tableView.backgroundView = count == 0 ? label : nil
        
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let console = consolesManager.consoles[indexPath.row]
        cell.textLabel?.text = console.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let console = consolesManager.consoles[indexPath.row]
        showAlert(with: console)
       
        // deselecionar atual cell
        tableView.deselectRow(at: indexPath, animated: false)
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            consolesManager.deleteConsole(index: indexPath.row, context: context)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func addConsole(_ sender: UIBarButtonItem) {
        
        showAlert(with: nil)
    }
    
    
    func showAlert(with console: Console?) {
        let title = console == nil ? "Adicionar" : "Editar"
        let alert = UIAlertController(title: title + " plataforma", message: nil, preferredStyle: .alert)
       
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Nome da plataforma"
           
            if let name = console?.name {
                textField.text = name
            }
        })
       
        alert.addAction(UIAlertAction(title: title, style: .default, handler: {(action) in
            let console = console ?? Console(context: self.context)
            console.name = alert.textFields?.first?.text
            do {
                try self.context.save()
                self.loadConsoles()
            } catch {
                print(error.localizedDescription)
            }
        }))
       
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.view.tintColor = UIColor(named: "second")
       
        present(alert, animated: true, completion: nil)
    }
    
}
