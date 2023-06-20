//
//  Katakana_Info.swift
//  UITest
//
//  Created by Emmet Carey on 22/05/2023.
//

import Foundation

struct Info {
    
    static let backgroundSymbols = [ "ア", "イ", "ウ", "エ", "オ","カ", "キ", "ク", "ケ", "コ","サ", "シ", "ス", "セ", "ソ","タ", "チ", "ツ", "テ", "ト","ナ", "ニ", "ヌ", "ネ", "ノ", "あ","い","う", "え", "お","か", "き", "く", "け", "こ","さ", "し", "す", "せ", "そ","た", "ち", "つ", "て", "と","な", "に", "ぬ", "ね", "の"]
    
    static let fontSizes1: [CGFloat] = [
        8, 10, 10,10,10,20,20,20,20,20,20,20,20,20,20,20, 30, 30, 30, 40, 40, 40, 60,150
    ]

    static let romNEW1: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        [],
        ["ta", "te", "ti", "to", "tu"],
        ["na", "ne", "ni", "no", "nu"],
        ["ha", "he", "hi", "ho", "hu"],
        [],
        ["ma", "me", "mi", "mo", "mu"],
        ["ra", "re", "ri", "ro", "ru"],
        ["ya", "yo", "yu","wa", "we", "wo"],
        [],
        ["ga", "ge", "gi", "go", "gu"],
        ["za", "ze", "zi", "zo", "zu"],
        ["da", "de", "di", "do", "du"],
        ["ba", "be", "bi", "bo", "bu"],
        ["pa", "pe", "pi", "po", "pu"],
        [],
        ["kya", "kye", "kyi", "kyo", "kyu"],
        ["sha", "she", "shi", "sho", "shu"],
        ["cha", "che", "chi", "cho", "chu"],
        [],
        ["nya", "nye", "nyi", "nyo", "nyu"],
        ["hya", "hye", "hyi", "hyo", "hyu"],
        ["mya", "mye", "myi", "myo", "myu"],
        [],
        ["rya", "rye", "ryi", "ryo", "ryu"],
        ["gya", "gye", "gyi", "gyo", "gyu"],
        ["ja", "je", "ji", "jo", "ju"],
        [],
        ["dja", "dje", "dji", "djo", "dju"],
        ["bya", "bye", "byi", "byo", "byu"],
        ["pya", "pye", "pyi", "pyo", "pyu"],
        []
    ]
    static let romList: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        ["ta", "te", "ti", "to", "tu"],
        ["na", "ne", "ni", "no", "nu"],
        ["ha", "he", "hi", "ho", "hu"],
        ["ma", "me", "mi", "mo", "mu"],
        ["ra", "re", "ri", "ro", "ru"],
        ["ya", "yo", "yu"],
        ["wa", "we", "wo"],
        ["ga", "ge", "gi", "go", "gu"],
        ["za", "ze", "zi", "zo", "zu"],
        ["da", "de", "di", "do", "du"],
        ["ba", "be", "bi", "bo", "bu"],
        ["pa", "pe", "pi", "po", "pu"],
        ["kya", "kye", "kyi", "kyo", "kyu"],
        ["sha", "she", "shi", "sho", "shu"],
        ["cha", "che", "chi", "cho", "chu"],
        ["nya", "nye", "nyi", "nyo", "nyu"],
        ["hya", "hye", "hyi", "hyo", "hyu"],
        ["mya", "mye", "myi", "myo", "myu"],
        ["rya", "rye", "ryi", "ryo", "ryu"],
        ["gya", "gye", "gyi", "gyo", "gyu"],
        ["ja", "je", "ji", "jo", "ju"],
        ["dja", "dje", "dji", "djo", "dju"],
        ["bya", "bye", "byi", "byo", "byu"],
        ["pya", "pye", "pyi", "pyo", "pyu"],
    ]
    static let katList: [[String]] = [
        ["ア", "エ", "イ", "オ", "ウ"],
        ["カ", "ケ", "キ", "コ", "ク"],
        ["サ", "セ", "シ", "ソ", "ス"],
        ["タ", "テ", "チ", "ト", "ツ"],
        ["ナ", "ネ", "ニ", "ノ", "ヌ"],
        ["ハ", "ヘ", "ヒ", "ホ", "フ"],
        ["マ", "メ", "ミ", "モ", "ム"],
        ["ラ", "レ", "リ", "ロ", "ル"],//r
        ["ヤ","ヨ", "ユ"],
        ["ワ", "ヱ", "ヲ"],//w
        ["ガ", "ゲ", "ギ", "ゴ", "グ"],
        ["ザ", "ゼ", "ジ", "ゾ", "ズ"],
        ["ダ", "デ", "ヂ", "ド", "ヅ"],
        ["バ", "ベ", "ビ", "ボ", "ブ"],
        ["パ", "ペ", "ピ", "ポ", "プ"],
        ["キャ", "キェ", "キィ", "キョ", "キュ"],
        ["シャ", "シェ", "シ", "ショ", "シュ"],
        ["チャ", "チェ", "チ", "チョ", "チュ"],
        ["ニャ", "ニェ", "ニィ", "ニョ", "ニュ"],
        ["ヒャ", "ヒェ", "ヒィ", "ヒョ", "ヒュ"],
        ["ミャ", "ミェ", "ミィ", "ミョ", "ミュ"],
        ["リャ", "リェ", "リィ", "リョ", "リュ"],
        ["ギャ", "ギェ", "ギィ", "ギョ", "ギュ"],
        ["ジャ", "ジェ", "ジ", "ジョ", "ジュ"],
        ["ヂャ", "ヂェ", "ヂ", "ヂョ", "ヂュ"],
        ["ビャ", "ビェ", "ビィ", "ビョ", "ビュ"],
        ["ピャ", "ピェ", "ピィ", "ピョ", "ピュ"],
    ]
    
    static let hirList: [[String]] = [
         ["あ", "え", "い", "お", "う"],
         ["か", "け", "き", "こ", "く"],
         ["さ", "せ", "し", "そ", "す"],
         ["た", "て", "ち", "と", "つ"],
         ["な", "ね", "に", "の", "ぬ"],
         ["は", "へ", "ひ", "ほ", "ふ"],
         ["ま", "め", "み", "も", "む"],
         ["ら", "れ", "り", "ろ", "る"],
         ["や","よ", "ゆ"],
         ["わ", "ゑ", "を"],
         ["が", "げ", "ぎ", "ご", "ぐ"],
         ["ざ", "ぜ", "じ", "ぞ", "ず"],
         ["だ", "で", "ぢ", "ど", "づ"],
         ["ば", "べ", "び", "ぼ", "ぶ"],
         ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
         ["きゃ", "きぇ", "きぃ", "きょ", "きゅ"],
         ["しゃ", "しぇ", "し", "しょ", "しゅ"],
         ["ちゃ", "ちぇ", "ち", "ちょ", "ちゅ"],
         ["にゃ", "にぇ", "にぃ", "にょ", "にゅ"],
         ["ひゃ", "ひぇ", "ひぃ", "ひょ", "ひゅ"],
         ["みゃ", "みぇ", "みぃ", "みょ", "みゅ"],
         ["りゃ", "りぇ", "りぃ", "りょ", "りゅ"],
         ["ぎゃ", "ぎぇ", "ぎぃ", "ぎょ", "ぎゅ"],
         ["じゃ", "じぇ", "じ", "じょ", "じゅ"],
         ["ぢゃ", "ぢぇ", "ぢ", "ぢょ", "ぢゅ"],
         ["びゃ", "びぇ", "びぃ", "びょ", "びゅ"],
         ["ぴゃ", "ぴぇ", "ぴぃ", "ぴょ", "ぴゅ"],
     ]
    
    
    static let katNEW1: [[String]] = [
        ["ア", "エ", "イ", "オ", "ウ"],
        ["カ", "ケ", "キ", "コ", "ク"],
        ["サ", "セ", "シ", "ソ", "ス"],
        [""],
        ["タ", "テ", "チ", "ト", "ツ"],
        ["ナ", "ネ", "ニ", "ノ", "ヌ"],
        ["ハ", "ヘ", "ヒ", "ホ", "フ"],
        [],
        ["マ", "メ", "ミ", "モ", "ム"],
        ["ラ", "レ", "リ", "ロ", "ル"],//r
        ["ヤ","ヨ", "ユ","ワ", "ヱ", "ヲ"],//w
        [],
        ["ガ", "ゲ", "ギ", "ゴ", "グ"],
        ["ザ", "ゼ", "ジ", "ゾ", "ズ"],
        ["ダ", "デ", "ヂ", "ド", "ヅ"],
        ["バ", "ベ", "ビ", "ボ", "ブ"],
        ["パ", "ペ", "ピ", "ポ", "プ"],
        [],
        ["キャ", "キェ", "キィ", "キョ", "キュ"],
        ["シャ", "シェ", "シ", "ショ", "シュ"],
        ["チャ", "チェ", "チ", "チョ", "チュ"],
        [],
        ["ニャ", "ニェ", "ニィ", "ニョ", "ニュ"],
        ["ヒャ", "ヒェ", "ヒィ", "ヒョ", "ヒュ"],
        ["ミャ", "ミェ", "ミィ", "ミョ", "ミュ"],
        [],
        ["リャ", "リェ", "リィ", "リョ", "リュ"],
        ["ギャ", "ギェ", "ギィ", "ギョ", "ギュ"],
        ["ジャ", "ジェ", "ジ", "ジョ", "ジュ"],
        [],
        ["ヂャ", "ヂェ", "ヂ", "ヂョ", "ヂュ"],
        ["ビャ", "ビェ", "ビィ", "ビョ", "ビュ"],
        ["ピャ", "ピェ", "ピィ", "ピョ", "ピュ"],
        [""]
    ]

   static let hirNEW1: [[String]] = [
        ["あ", "え", "い", "お", "う"],
        ["か", "け", "き", "こ", "く"],
        ["さ", "せ", "し", "そ", "す"],
        [""],
        ["た", "て", "ち", "と", "つ"],
        ["な", "ね", "に", "の", "ぬ"],
        ["は", "へ", "ひ", "ほ", "ふ"],
        [""],
        ["ま", "め", "み", "も", "む"],
        ["ら", "れ", "り", "ろ", "る"],
        ["や","よ", "ゆ","わ", "ゑ", "を"],
        [""],
        ["が", "げ", "ぎ", "ご", "ぐ"],
        ["ざ", "ぜ", "じ", "ぞ", "ず"],
        ["だ", "で", "ぢ", "ど", "づ"],
        ["ば", "べ", "び", "ぼ", "ぶ"],
        ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
        [""],
        ["きゃ", "きぇ", "きぃ", "きょ", "きゅ"],
        ["しゃ", "しぇ", "し", "しょ", "しゅ"],
        ["ちゃ", "ちぇ", "ち", "ちょ", "ちゅ"],
        [""],
        ["にゃ", "にぇ", "にぃ", "にょ", "にゅ"],
        ["ひゃ", "ひぇ", "ひぃ", "ひょ", "ひゅ"],
        ["みゃ", "みぇ", "みぃ", "みょ", "みゅ"],
        [""],
        ["りゃ", "りぇ", "りぃ", "りょ", "りゅ"],
        ["ぎゃ", "ぎぇ", "ぎぃ", "ぎょ", "ぎゅ"],
        ["じゃ", "じぇ", "じ", "じょ", "じゅ"],
        [""],
        ["ぢゃ", "ぢぇ", "ぢ", "ぢょ", "ぢゅ"],
        ["びゃ", "びぇ", "びぃ", "びょ", "びゅ"],
        ["ぴゃ", "ぴぇ", "ぴぃ", "ぴょ", "ぴゅ"],
        [""]
    ]
    
    
}

