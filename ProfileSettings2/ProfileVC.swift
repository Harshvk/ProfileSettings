import UIKit

class ProfileVC: UIViewController {
    
 
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
   
    
 
    // Make outlet of tableView
    @IBOutlet weak var settingsTableView: UITableView!
    
    
    
     // Defining of data to be displayed
    var dataDict : [[String:String]] = [["Title" : "FULL NAME" , "Info" : "John Smith"],
                                        ["Title" : "EMAIL" , "Info" : "johnsmith@address.com"],
                                        ["Title" : "PASSWORD" , "Info" : "12345678"],
                                        ["Title" : "BIRTHDAY" , "Info" : "August 26, 1989"],
                                        ["Title" : "GENDER" , "Info" : "Male"],
                                        ["Title" : "HEIGHT" , "Info" : "6'0\""],
                                        ["Title" : "WEIGHT" , "Info" : "155 lbs"],
                                        ["Title" : "PHONE NO" , "Info" : "123456789"],
                                        ["Title" : "BLOOD GROUP" , "Info" : "B+"],
                                        ["Title" : "NATIONALITY" , "Info" : "Indian"]
    ]
   
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Defining Datasource and delegate for tableView
        self.settingsTableView.dataSource = self
        self.settingsTableView.delegate = self
        
        // Registering Nib in TableView
        let nib = UINib(nibName: "ListCell", bundle: nil)
        settingsTableView.register(nib, forCellReuseIdentifier: "ListCellID")
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        //Adding Oveserver To Notification Centre for notifying KeyboardDidAppear
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
        
        guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
            else{ return }
        
        let keyboardHeight = userinfo.cgRectValue.height
            
        
        self.tableViewBottomConstraint.constant = keyboardHeight
        
       
        })
        
        //Adding Oveserver To Notification Centre for notifying KeyboardWillHide

        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
            
            self.tableViewBottomConstraint.constant = 0
            
        })
        
        
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        //Removing Observer From Notification Centre
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    
    
    // MARK: Private Functions
  
}

// MARK: DataSource and Delegate

extension ProfileVC : UITableViewDataSource,UITableViewDelegate{
    
    // Defining No of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDict.count+2
    }
    
    // Providing cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch(indexPath.row)
        {
            
            
        case 0 :                let cell = tableView.dequeueReusableCell(withIdentifier: "HeadingCellID", for: indexPath) as! HeadingCell
                                return cell

        case dataDict.count+1 : let cell = tableView.dequeueReusableCell(withIdentifier: "SaveChangeID", for: indexPath) as! SaveChangeCell
                                return cell
        
        default :               let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellID", for: indexPath) as! ListCell
                                cell.configureCell(dataDict[indexPath.row-1])
                                return cell

        }
        

    }
    // Defining height of each Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch(indexPath.row)
        {
            
            
        case 0 :                  return self.view.bounds.height*275/667
          
        case 1 :                  return 90
            
        case dataDict.count+1 :   return 158
            
            
        default :                 return 71
        }
       
    }


}

extension ProfileVC : UITextFieldDelegate{
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("hii")
        
    }
    
    
    
}




class HeadingCell : UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var changePP: UIButton!
    
    override func awakeFromNib() {
    
        profilePic.layer.masksToBounds = true
        profilePic.layer.cornerRadius = profilePic.layer.bounds.width/2
        profilePic.layer.borderWidth = 1
        profilePic.layer.borderColor = UIColor.white.cgColor
        changePP.layer.cornerRadius = changePP.layer.bounds.width/2
    }
    
    //MARK: IBAction
    
    @IBAction func changePPAction(_ sender: UIButton) {
    
    }
    

    
}
    



class SaveChangeCell : UITableViewCell {
    @IBOutlet weak var saveBtn: UIButton!
    
    
    override func awakeFromNib() {
        saveBtn.layer.cornerRadius = saveBtn.layer.bounds.height/2
    }

    //MARK: IBActions
    @IBAction func saveBtnAction(_ sender: UIButton) {
        
    }
    
}


