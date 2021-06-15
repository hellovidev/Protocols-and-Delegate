//
//  main.swift
//  Protocols and Delegate
//
//  Created by Sergey Romanchuk on 15.06.21.
//

import Foundation

// MARK: - The Delegate Design Pattern

protocol AdvancedLifeSupport {
    func performCardiopulmonaryResuscitation()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCardiopulmonaryResuscitation()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    /*
     
     And through this line of code, they've said, "I am going to listen for notifications when I have to perform CPR from the emergency call handler.
     I know who the handler is. And when they tell me to perform CPR that's exactly what I'm gonna do."
     
     */
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCardiopulmonaryResuscitation() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCardiopulmonaryResuscitation() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("The doctor listening for heart sounds.")
    }
    
}

class Surgeon: Doctor {
    override func performCardiopulmonaryResuscitation() {
        super.performCardiopulmonaryResuscitation()
        print("Signs staying alive by the BeeGees")
    }
    
    func useelectricDrill() {
        print("Whirrr...")
    }
}


let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let doctor = Doctor(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
