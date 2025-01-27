//
//  JoinGroupVC.swift
//  Kibble
//
//  Created by VICTOR CHU on 2019-09-10.
//  Copyright © 2019 Victor Chu. All rights reserved.
//

import UIKit
import Firebase
import Pastel
import SwipeCellKit
import UserNotifications

@available(iOS 13.0, *)
class MealsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var addMealButton: UIButton!
    @IBOutlet var pastelView: PastelView!
    private let refreshControl = UIRefreshControl()
    private var mealArray = [Meal]()

    let petImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height / 2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let petnameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = Device.roundedFont(ofSize: .largeTitle, weight: .heavy)
        label.textAlignment = .center
        return label
    }()

    let settingsButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setImage(#imageLiteral(resourceName: "Settings"), for: .normal)
        return button
    }()

    let membersButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setImage(#imageLiteral(resourceName: "membersButton"), for: .normal)
        return button
    }()

    let tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPushNotifications()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 200
        retrieveMealData(firstRun: true)
    }

    override func loadView() {
        super.loadView()
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        addMealButton.addTarget(self, action: #selector(addMealButtonPressed), for: .touchUpInside)
        tableView.register(MealCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorColor = UIColor.clear
        tableView.alpha = 0
        tableView.addSubview(refreshControl)
        self.view.addSubview(tableView)
        self.view.addSubview(addMealButton)
        refreshControl.addTarget(self, action: #selector(mealDataRefresh), for: .valueChanged)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }

    func retrieveMealData(firstRun: Bool) {
        guard let uid = Auth.auth().currentUser?.uid else { fatalError("Current user uid is nil") }
        DataService.instance.retrieveCurrentPet(forUid: uid) { (petId) in
            DataService.instance.retrieveAllPetMeals(forPetId: petId!) { (retreivedMeals) in
                self.mealArray = retreivedMeals
                self.setUpLocalNotifications()
                UIView.transition(with: self.tableView,
                                  duration: 0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.tableView.reloadData() })
                self.refreshControl.endRefreshing()
            }
            self.addMealButton.isHidden = false
            if (firstRun) {
                self.tableView.fadeIn(duration: 1, delay: 0.2) { (Bool) in }
            }
        }
    }

    func setUpLocalNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()

        for meal in mealArray {
            let time = meal.notification
            if time != "none" {

                let content = UNMutableNotificationContent()
                content.title = "Time to feed your pet \(meal.name)!"
                content.sound = UNNotificationSound.default

                // Convert 12hr string to 12hr date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                let date12Hr = dateFormatter.date(from: time)
                // Convert 12hr date to 24hr string
                dateFormatter.dateFormat = "HH:mm"
                let string24Hr = dateFormatter.string(from: date12Hr!)
                print(string24Hr)
                // 24hr string to 24hr date
                let date24Hr = dateFormatter.date(from: string24Hr)

                let calendar = Calendar(identifier: .gregorian)
                let hour = calendar.component(.hour, from: date24Hr!)
                let minute = calendar.component(.minute, from: date24Hr!)
                print("\(hour) + \(minute)")

                var dateComponents = DateComponents()
                dateComponents.hour = hour
                dateComponents.minute = minute

                // show this notification for meal times from now
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: meal.name, content: content, trigger: trigger)
                notificationCenter.add(request)
            }
        }
    }

    func registerForPushNotifications() {
      UNUserNotificationCenter.current() // 1
        .requestAuthorization(options: [.alert, .sound, .badge]) { // 2
          granted, error in
          print("Permission granted: \(granted)") // 3
      }
    }


    // MARK: - Add Target Methods

    @objc func mealDataRefresh() {
        retrieveMealData(firstRun: false)
    }

    @objc func addMealButtonPressed() {
        let addMealVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMealVC") as! AddMealViewController
        addMealVC.delegate = self
        self.present(addMealVC, animated: true, completion: nil)
    }

    @objc func settingsButtonPressed() {
        performSegue(withIdentifier: "SettingsSegue", sender: self)
    }

}

// MARK: - Table View Delegate

@available(iOS 13.0, *)
extension MealsViewController: UITableViewDelegate, UITableViewDataSource, SwipeTableViewCellDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealArray.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MealCell
        cell.delegate = self
        cell.configureCell(isFed: meal.isFed, name: meal.name, type: meal.type)
        return cell
    }

    // Edit Meal
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = mealArray[indexPath.row]
        let editMealVC = self.storyboard?.instantiateViewController(identifier: "EditMealVC") as! EditMealViewController
        editMealVC.delegate = self
        editMealVC.setupVariables(name: meal.name, type: meal.type, notification: meal.notification)
        self.present(editMealVC, animated: true, completion: nil)
    }

    // Swipe Cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        if orientation == .left {
            let doneAction = SwipeAction(style: .destructive, title: "Done") { action, indexPath in
                DataService.instance.retrieveCurrentPet(forUid: Auth.auth().currentUser!.uid) { (petId) in
                    let mealName = self.mealArray[indexPath.row].name
                    DataService.instance.updatePetMeals(withPetId: petId!, withMealName: mealName, andMealData: ["isFed":"true"]) {
                        self.retrieveMealData(firstRun: false)
                    }
                }
            }
            doneAction.backgroundColor = #colorLiteral(red: 0.6509803922, green: 0.9294117647, blue: 0.4745098039, alpha: 1)
            return [doneAction]
        } else if orientation == .right {
            let undoAction = SwipeAction(style: .destructive, title: "Undo") { action, indexPath in
                DataService.instance.retrieveCurrentPet(forUid: Auth.auth().currentUser!.uid) { (petId) in
                    let mealName = self.mealArray[indexPath.row].name
                    DataService.instance.updatePetMeals(withPetId: petId!, withMealName: mealName, andMealData: ["isFed":"false"]) {
                        self.retrieveMealData(firstRun: false)
                    }
                }
            }
            undoAction.backgroundColor = #colorLiteral(red: 1, green: 0.3400763623, blue: 0.3629676378, alpha: 1)
            return [undoAction]
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive(automaticallyDelete: false)
        options.transitionStyle = .border
        return options
    }

    //MARK: - Table View Header Set Up

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.zero)
        headerView.backgroundColor = UIColor.clear
        headerView.addSubview(settingsButton)
        headerView.addSubview(petImage)
        headerView.addSubview(petnameLabel)

        DataService.instance.retrieveCurrentPet(forUid: Auth.auth().currentUser!.uid) { (petId) in
            DataService.instance.retrievePet(petId!) { (returnedPet) in
                if let pet = returnedPet {
                    self.petnameLabel.text = pet.name
                    if let imageUrlString = pet.photoUrl {
                        let imageUrl = URL(string: imageUrlString)!
                        let imageData = try! Data(contentsOf: imageUrl)
                        let image = UIImage(data: imageData)
                        self.petImage.image = image
                    } else {
                        self.petImage.image = #imageLiteral(resourceName: "dog")
                    }
                }
            }
        }

        petImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            petImage.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20.adjusted),
            petImage.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            petImage.widthAnchor.constraint(equalToConstant: 90),
            petImage.heightAnchor.constraint(equalToConstant: 90)
        ])

        petnameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            petnameLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            petnameLabel.topAnchor.constraint(equalTo: petImage.bottomAnchor, constant: 5.adjusted)
        ])

        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
        ])

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

extension MealsViewController: AddMealViewControllerDelegate {
    func refreshTableView() {
        retrieveMealData(firstRun: false)
    }
}
