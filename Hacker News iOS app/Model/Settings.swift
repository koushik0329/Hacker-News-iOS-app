//
//  Settings.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/27/25.
//


struct Settings {
    var title: String
    var lefticon: String
    var righticon: String
    
    static func getSettingsList() -> [Settings] {
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
}
