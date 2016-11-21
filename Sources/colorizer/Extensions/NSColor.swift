import AppKit.NSColor

enum NSColorError: Error {
    case wrongString
}

extension NSColor {

    convenience init(hex: UInt32) {
        let red = (hex >> 24) & 0xff
        let green = (hex >> 16) & 0xff
        let blue = (hex >> 8) & 0xff
        let alpha = hex & 0xff
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)        
    }
    
    convenience init(hexString hex: String) throws {
        var hex = hex.withoutPrefix("#").withoutPrefix("0x").uppercased()
        if hex.characters.count == 6 {
            hex = hex + "FF" // if there is no alpha
        }
        
        if hex.characters.count != 8 {
            throw NSColorError.wrongString
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        
        self.init(hex: rgbValue)
    }

}