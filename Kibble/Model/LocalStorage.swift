//
//  LocalStorage.swift
//  Kibble
//
//  Created by VICTOR CHU on 2020-04-21.
//  Copyright © 2020 Victor Chu. All rights reserved.
//

import Foundation

class LocalStorage {
    static var instance = LocalStorage()

    private var _petIds = Dictionary<String,PetId>()
    private var _userAllPets = Dictionary<String,Any>()
    private var _currentPetMeals = [Meal]()
    private var _currentUser = User(withId: "", withName: "", withEmail: "", withCurrentPet: "", withPets: [:])

    var petIds: Dictionary<String,PetId> {
        set { _petIds = newValue }
        get { return _petIds }
    }

    var currentPetMeals: [Meal] {
        set { _currentPetMeals = newValue }
        get { return _currentPetMeals }
    }

    var currentUser: User {
        set { _currentUser = newValue }
        get { return _currentUser }
    }

    var userAllPets: Dictionary<String,Any> {
        set { _userAllPets = newValue }
        get { return _userAllPets }
    }
}