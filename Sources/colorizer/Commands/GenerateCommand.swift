import Foundation
import SwiftCLI
import PathKit
import AppKit.NSColor

class GenerateCommand: Command {

    let name = "generate"
    let shortDescription = "Generating CLR pallete (.clr file) from .txt file."
    let signature = "<InputFile> <OutputFile>"

    enum CommandError: Error {
        case noInputFile
        case invalidInputFile
        
        var description: String {
            switch self {
            case .noInputFile: return "InputFile do not exists. Please provide .txt file."
            case .invalidInputFile: return "InputFile is invalid. Please provide valid .txt file."
            }
        }
    }

    func execute(arguments: CommandArguments) throws {
        do {
            let inputFilePath = Path(arguments.requiredArgument("InputFile"))
            if !inputFilePath.isFile {
                throw CommandError.noInputFile
            }
    
            var colorFileParser: ColorFileParser? = nil
            do {
                switch inputFilePath.`extension` ?? "" {
                case "txt":
                    colorFileParser = try TextColorFileParser(path: inputFilePath)
                default: ()
                }
            }
            catch {
                throw CommandError.invalidInputFile
            }
    
            guard let parser = colorFileParser else {
                throw CommandError.invalidInputFile
            }
    
            let outputFileString = arguments.requiredArgument("OutputFile")
            let colorList = NSColorList(name: outputFileString)
            for (name, color) in parser.colors {
                colorList.setColor(color, forKey: name)
            }
            colorList.write(toFile: outputFileString)
        
            print("Generated successfully.")
        }
        catch let error as CommandError {
            print("Error: \(error.description)")
        }
    }

}