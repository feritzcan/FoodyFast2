//
//  FirstViewController.swift
//  FoodyFast
//
//  Created by Ferit Özcan on 13/11/2016.
//  Copyright © 2016 Potetic. All rights reserved.
//

import UIKit
//import RPSlidingMenu


import SWFrameButton
import PagedHorizontalView
class HomeController: UIViewController{
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    var numberOfItemsInSlidingMenu=10;
    
    
    //Collection view
    let identifier = "collectionViewCell"
    
    
    //INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var restmanager=RestaurantManager()
        restmanager.getRestaurants()
        
        var login=LoginManager();
        login.getLogin()
        barButton.image=UIImage(named: "side")
        tableView.delegate=self
        tableView.dataSource=self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "splash")!)
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        barButton.image=UIImage(named: "side")
        // FIXME: Remove code below if u're using your own menu
        setupNavforDefaultMenu()
    }
    private func setupNavforDefaultMenu() {
        barButton.image = UIImage(named: "burger")?.withRenderingMode(.alwaysOriginal)
        // Set navigation bar translucent style
        self.navigationBarTranslucentStyle()
        // Update side menu
        sideMenuManager?.sideMenuController()?.sideMenu?.isNavbarHiddenOrTransparent = true
        // Re-enable sidemenu
        sideMenuManager?.sideMenuController()?.sideMenu?.disabled = false
    }
    
    @IBAction func toogleSideMenu(_ sender: AnyObject) {
        sideMenuManager?.toggleSideMenuView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

extension HomeController:UITableViewDelegate{
    
}
extension HomeController:UITableViewDataSource{
    
    
    
    
    
    
    
    //NUMBER OF ITEMS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
        
    }
    
    
    // GET CELLS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        print("table")
        
        let cell:ShowRoomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ShowRoomCell")! as! ShowRoomTableViewCell
        cell.name.text="Nusret Steak House"
        cell.name.strokePosition = .outside
        cell.locationLabel.text="32KM"
        
        return cell
        
        
    }
}




