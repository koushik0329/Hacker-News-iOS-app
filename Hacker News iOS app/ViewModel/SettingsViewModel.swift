//
//  SettingsViewModel.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/3/25.
//

import Foundation

class SettingsViewModel {
    	
    var settingsList: [Settings] = []
    
    init() {
        self.settingsList = getSettingsList()
    }
    
    func getSettingsList() -> [Settings] {
        return [
            Settings(title: "Airplane Mode", lefticon: "airplane", righticon: "chevron.right"),
            Settings(title: "Wi-Fi", lefticon: "wifi", righticon: "chevron.right"),
            Settings(title: "Bluetooth", lefticon: "phone.connection.fill", righticon: "chevron.right"),
            Settings(title: "Cellular", lefticon: "antenna.radiowaves.left.and.right", righticon: "chevron.right"),
            Settings(title: "Battery", lefticon: "battery.100percent", righticon: "chevron.right"),
            Settings(title: "General", lefticon: "gearshape", righticon: "chevron.right"),
            Settings(title: "Accessibility", lefticon: "figure.wave", righticon: "chevron.right"),
            Settings(title: "Camera", lefticon: "camera", righticon: "chevron.right"),
            Settings(title: "Control Center", lefticon: "switch.2", righticon: "chevron.right"),
            Settings(title: "Display & Brightness", lefticon: "textformat.size", righticon: "chevron.right"),
            Settings(title: "Home Screen & App Library", lefticon: "square.grid.2x2", righticon: "chevron.right"),
            Settings(title: "Search", lefticon: "magnifyingglass", righticon: "chevron.right"),
            Settings(title: "Wallpaper", lefticon: "photo.fill", righticon: "chevron.right"),
            Settings(title: "Notifications", lefticon: "bell.badge.fill", righticon: "chevron.right"),
            Settings(title: "Sound & Haptics", lefticon: "speaker.wave.2.fill", righticon: "chevron.right"),
            Settings(title: "Focus", lefticon: "moon.fill", righticon: "chevron.right"),
            Settings(title: "Screen Time", lefticon: "timer", righticon: "chevron.right"),
            Settings(title: "Face ID & Passcode", lefticon: "faceid", righticon: "chevron.right"),
            Settings(title: "Emergency SOS", lefticon: "sos", righticon: "chevron.right"),
            Settings(title: "Privacy & Security", lefticon: "hand.raised.fill", righticon: "chevron.right"),
            Settings(title: "Game Center", lefticon: "gamecontroller", righticon: "chevron.right"),
            Settings(title: "iCloud", lefticon: "icloud.fill", righticon: "chevron.right"),
            Settings(title: "Wallet & Apple Pay", lefticon: "wallet.bifold.fill", righticon: "chevron.right"),
            Settings(title: "Apps", lefticon: "apps.iphone", righticon: "chevron.right"),
        ]
    }
    
    func getSettingaCount() -> Int {
        return settingsList.count
    }
    
    func getSetting(at index: Int) -> Settings? {
            guard index >= 0 && index < settingsList.count else { return nil }
            return settingsList[index]
        }
        
        
    func getSettingForSection(_ section: Int, row: Int) -> Settings? {
        let index: Int
        
        switch section {
        case 0:
            index = row
        case 1:
            index = row + 5
        case 2:
            index = row + 13
        case 3:
            index = row + 17
        case 4:
            index = row + 20
        case 5:
            index = row + 23
        default:
            return nil
        }
        
        return getSetting(at: index)
    }
    
    func getSettingsCountForSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 8
        case 2:
            return 4
        case 3:
            return 3
        case 4:
            return 3
        case 5:
            return getSettingaCount() - 23
        default:
            return 0
        }
    }
    
    func getHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return 20
    }
    
    func getNumberOfSections() -> Int {
        return 6
    }
}

