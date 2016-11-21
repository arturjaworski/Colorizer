import PathKit
import AppKit.NSColor

protocol ColorFileParser {
    init(path: Path) throws
    var colors: [(name: String, color: NSColor)] { get }
}

class TextColorFileParser: ColorFileParser {
    private(set) var colors: [(name: String, color: NSColor)] = []
    
    required init(path: Path) throws {
        let contents = try path.read(.utf8)
        let lines = contents.components(separatedBy: .newlines)
        
        for line in lines {
            let elements = line.components(separatedBy: ":").map { $0.trimmingCharacters(in: .whitespaces) }
            if elements.count != 2 {
                continue
            }
            
            var value: (name: String, color: NSColor)
            do {
                value = (
                    name: elements.first!,
                    color: try NSColor(hexString: elements.last!)
                )
            }
            catch {
                continue
            }
            
            colors.append(value)
        }
    }
}
