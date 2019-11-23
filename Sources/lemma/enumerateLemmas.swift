import Foundation
#if canImport(NaturalLanguage)
import NaturalLanguage
#endif

func enumerateLemmas(in string: String, using block: (String, String) -> Void) {
    if #available(OSX 10.14, *) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex ..< string.endIndex, unit: .word, scheme: .lemma, options: []) { (tag, range) -> Bool in
            if let tag = tag {
                block(tag.rawValue, String(string[range]))
            }

            return true
        }
    } else {
        let tagger = NSLinguisticTagger(tagSchemes: [.lemma], options: 0)
        tagger.string = string
        tagger.enumerateTags(in: NSRange(string.startIndex ..< string.endIndex, in: string), scheme: .lemma, options: []) { tag, tokenRange, _, _ in
            if let tag = tag {
                block(tag.rawValue, (string as NSString).substring(with: tokenRange))
            }
        }
    }
}

