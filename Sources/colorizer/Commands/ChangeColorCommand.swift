import Foundation
import SwiftCLI
import PathKit
import AppKit.NSColor

class ChangeColorCommand: Command {

    let name = "change-color"
    let shortDescription = "Changing all color occurrences in storyboards."
    let signature = "<input-file> <old-color> <new-color>"
    
    var colorName: String? = nil
    
    enum CommandError: Error {
        case noInputFile
        case invalidInputFile
        case invalidOldColor
        case invalidNewColor
        
        var description: String {
            switch self {
            case .noInputFile: return "<input-file> do not exists. Please provide .storyboard file."
            case .invalidInputFile: return "<input-file> is invalid. Please provide valid .storyboard file."
            case .invalidOldColor: return "<old-color> is invalid."
            case .invalidNewColor: return "<new-color> is invalid."
            }
        }
    }
    
    func execute(arguments: CommandArguments) throws {
        do {
            let inputFilePath = Path(arguments.requiredArgument("input-file"))
            if !inputFilePath.isFile {
                throw CommandError.noInputFile
            }
            
            let oldColor: NSColor
            do {
                oldColor = try NSColor(hexString: arguments.requiredArgument("old-color"))
            }
            catch {
                throw CommandError.invalidOldColor
            }
            
            let newColor: NSColor
            do {
                newColor = try NSColor(hexString: arguments.requiredArgument("old-color"))
            } catch {
                throw CommandError.invalidNewColor
            }
            
            // TODO
        }
        catch let error as CommandError {
            print("Error: \(error.description)")
        }
    }
    
    func setupOptions(options: OptionRegistry) {
        options.add(keys: ["-n", "--name"], usage: "Color name", valueSignature: "name") { (name) in
            if name.characters.count > 0 {
                self.colorName = name
            }
        }
    }

}