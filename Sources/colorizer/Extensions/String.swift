import Foundation

extension String {
    func withoutPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return String(self.characters.dropFirst(prefix.characters.count))
        }
        return self
    }
}