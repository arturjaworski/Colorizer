import Foundation
import PathKit
import AppKit.NSColor
import SwiftCLI

CLI.setup(name: "colorizer", version: "0.1.2")
CLI.register(command: GenerateCommand())
_ = CLI.go()
