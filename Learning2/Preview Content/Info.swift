//
//  Katakana_Info.swift
//  UITest
//
//  Created by Emmet Carey on 22/05/2023.
//

import Foundation

struct Info {
    
    static let backgroundSymbols = [ "ア", "イ", "ウ", "エ", "オ","カ", "キ", "ク", "ケ", "コ","サ", "シ", "ス", "セ", "ソ","タ", "チ", "ツ", "テ", "ト","ナ", "ニ", "ヌ", "ネ", "ノ", "あ","い","う", "え", "お","か", "き"]
    
    static let fontSizes1: [CGFloat] = [
        8, 10, 10,10,10,20,20,20,20, 30, 30, 30, 40, 40, 40, 40, 40, 40, 60,150
    ]

    static let normalDist: [String] = ["0.0000", "0.0110", "0.0220", "0.0330", "0.0440", "0.0550", "0.0660", "0.0770", "0.0880", "0.0990", "0.1100", "0.1210", "0.1320", "0.1430", "0.1540", "0.1650", "0.1760", "0.1870", "0.1980", "0.2090", "0.2200", "0.2310", "0.2420", "0.2530", "0.2640", "0.2750", "0.2860", "0.2970", "0.3080", "0.3190", "0.3300", "0.3410", "0.3520", "0.3630", "0.3740", "0.3850", "0.3960", "0.4070", "0.4180", "0.4290", "0.4400", "0.4510", "0.4620", "0.4730", "0.4840", "0.4950", "0.5000", "0.5060", "0.5170", "0.5280", "0.5390", "0.5500", "0.5610", "0.5720", "0.5830", "0.5940", "0.6050", "0.6160", "0.6270", "0.6380", "0.6490", "0.6600", "0.6710", "0.6820", "0.6930", "0.7040", "0.7150", "0.7260", "0.7370", "0.7480", "0.7590", "0.7700", "0.7810", "0.7920", "0.8030", "0.8140", "0.8250", "0.8360", "0.8470", "0.8580", "0.8690", "0.8800", "0.8910", "0.9020", "0.9130", "0.9240", "0.9350", "0.9460", "0.9570", "0.9680", "0.9790", "0.9900", "1.0000"]


    static let romList: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        ["ta", "te", "chi", "to", "tsu"],
        ["na", "ne", "ni", "no", "nu"],
        ["ha", "he", "hi", "ho", "hu"],
        ["ma", "me", "mi", "mo", "mu"],
        ["ra", "re", "ri", "ro", "ru"],
        ["ya", "yo", "yu","wa", "we", "wo"],
        ["ga", "ge", "gi", "go", "gu"],
        ["za", "ze", "zi", "zo", "zu"],
        ["da", "de", "di", "do", "du"],
        ["ba", "be", "bi", "bo", "bu"],
        ["pa", "pe", "pi", "po", "pu"],
        ["kya", "kyo", "kyu"],
        ["sha", "sho", "shu"],
        ["cha", "cho", "chu"],
        ["nya", "nyo", "nyu"],
        ["hya", "hyo", "hyu"],
        ["mya", "myo", "myu"],
        ["rya", "ryo", "ryu"],
        ["gya", "gyo", "gyu"],
        ["ja", "jo", "ju"],
        ["dja", "djo", "dju"],
        ["bya", "byo", "byu"],
        ["pya", "pyo", "pyu"],
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
        ["ヤ","ヨ", "ユ","ワ", "ヱ", "ヲ"],//w
        ["ガ", "ゲ", "ギ", "ゴ", "グ"],
        ["ザ", "ゼ", "ジ", "ゾ", "ズ"],
        ["ダ", "デ", "ヂ", "ド", "ヅ"],
        ["バ", "ベ", "ビ", "ボ", "ブ"],
        ["パ", "ペ", "ピ", "ポ", "プ"],
  
        ["キャ", "キョ", "キュ"],
        ["シャ", "ショ", "シュ"],
        ["チャ", "チョ", "チュ"],
   
        ["ニャ", "ニョ", "ニュ"],
        ["ヒャ", "ヒョ", "ヒュ"],
        ["ミャ", "ミョ", "ミュ"],
  
        ["リャ", "リョ", "リュ"],
        ["ギャ", "ギョ", "ギュ"],
        ["ジャ", "ジョ", "ジュ"],
 
        ["ヂャ", "ヂョ", "ヂュ"],
        ["ビャ", "ビョ", "ビュ"],
        ["ピャ", "ピョ", "ピュ"],
     
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
         ["や","よ", "ゆ","わ", "ゑ", "を"],
         ["が", "げ", "ぎ", "ご", "ぐ"],
         ["ざ", "ぜ", "じ", "ぞ", "ず"],
         ["だ", "で", "ぢ", "ど", "づ"],
         ["ば", "べ", "び", "ぼ", "ぶ"],
         ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
         ["きゃ", "きょ", "きゅ"],
         ["しゃ",  "しょ", "しゅ"],
         ["ちゃ",  "ちょ", "ちゅ"],
         ["にゃ", "にょ", "にゅ"],
         ["ひゃ", "ひょ", "ひゅ"],
         ["みゃ","みょ", "みゅ"],
         ["りゃ", "りょ", "りゅ"],
         ["ぎゃ", "ぎょ", "ぎゅ"],
         ["じゃ", "じょ", "じゅ"],
         ["ぢゃ",  "ぢょ", "ぢゅ"],
         ["びゃ", "びょ", "びゅ"],
         ["ぴゃ", "ぴょ", "ぴゅ"],
     ]
   
    
    static let katNEW1: [[String]] = [
        ["ア", "エ", "イ", "オ", "ウ"],
        ["カ", "ケ", "キ", "コ", "ク"],
        ["サ", "セ", "シ", "ソ", "ス"],
        [],
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
        ["キャ", "キョ", "キュ"],
        ["シャ", "ショ", "シュ"],
        ["チャ", "チョ", "チュ"],
        [],
        ["ニャ", "ニョ", "ニュ"],
        ["ヒャ", "ヒョ", "ヒュ"],
        ["ミャ", "ミョ", "ミュ"],
        [],
        ["リャ", "リョ", "リュ"],
        ["ギャ", "ギョ", "ギュ"],
        ["ジャ", "ジョ", "ジュ"],
        [],
        ["ヂャ", "ヂョ", "ヂュ"],
        ["ビャ", "ビョ", "ビュ"],
        ["ピャ", "ピョ", "ピュ"],
        []
    ]

   static let hirNEW1: [[String]] = [
    ["あ", "え", "い", "お", "う"],
    ["か", "け", "き", "こ", "く"],
    ["さ", "せ", "し", "そ", "す"],
    [],
    ["た", "て", "ち", "と", "つ"],
    ["な", "ね", "に", "の", "ぬ"],
    ["は", "へ", "ひ", "ほ", "ふ"],
    [],
    ["ま", "め", "み", "も", "む"],
    ["ら", "れ", "り", "ろ", "る"],
    ["や","よ", "ゆ","わ", "ゑ", "を"],
    [],
    ["が", "げ", "ぎ", "ご", "ぐ"],
    ["ざ", "ぜ", "じ", "ぞ", "ず"],
    ["だ", "で", "ぢ", "ど", "づ"],
    ["ば", "べ", "び", "ぼ", "ぶ"],
    ["ぱ", "ぺ", "ぴ", "ぽ", "ぷ"],
    [],
    ["きゃ", "きょ", "きゅ"],
    ["しゃ",  "しょ", "しゅ"],
    ["ちゃ",  "ちょ", "ちゅ"],
    [],
    ["にゃ", "にょ", "にゅ"],
    ["ひゃ", "ひょ", "ひゅ"],
    ["みゃ","みょ", "みゅ"],
    [],
    ["りゃ", "りょ", "りゅ"],
    ["ぎゃ", "ぎょ", "ぎゅ"],
    ["じゃ", "じょ", "じゅ"],
    [],
    ["ぢゃ",  "ぢょ", "ぢゅ"],
    ["びゃ", "びょ", "びゅ"],
    ["ぴゃ", "ぴょ", "ぴゅ"],
    []
    ]
    
    static let romNEW1: [[String]] = [
        
        ["a", "e", "i", "o", "u"],
        ["ka", "ke", "ki", "ko", "ku"],
        ["sa", "se", "shi", "so", "su"],
        [],
        ["ta", "te", "chi", "to", "tsu"],
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
        ["kya", "kyo", "kyu"],
        ["sha", "sho", "shu"],
        ["cha", "cho", "chu"],
        [],
        ["nya", "nyo", "nyu"],
        ["hya", "hyo", "hyu"],
        ["mya", "myo", "myu"],
        [],
        ["rya", "ryo", "ryu"],
        ["gya", "gyo", "gyu"],
        ["ja", "jo", "ju"],
        [],
        ["dja", "djo", "dju"],
        ["bya", "byo", "byu"],
        ["pya", "pyo", "pyu"],
        []
    ]
    
    
}

