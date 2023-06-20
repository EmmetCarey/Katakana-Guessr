//
//  GetLevels.swift
//  Learning2
//
//  Created by Emmet Carey on 13/06/2023.
//

import Foundation


let allK1 = Info.katNEW1.enumerated().map { [$0.element, Info.romNEW1[$0.offset]] }
let allH1 = Info.hirNEW1.enumerated().map { [$0.element, Info.romNEW1[$0.offset]] }

func getQuestions(isKat: Bool,level: Int) -> [[String]] {

    if isKat{
        return allK1[level]
    }
    else{
        return allH1[level]
    }
    
}

func getTest(isKat: Bool, levels: [Int]) -> [[String]] {
     // Initialize empty arrays for Katakana and Romaji
    var kat: [String] = []
    var rom: [String] = []
    var hir: [String] = []
    var questions: [[String]] = [[],[]]
    
    if isKat{
        for level in levels{
            kat += Info.katNEW1[level]
            rom += Info.romNEW1[level]
        }
        questions = [kat,rom]
    }
    
    if !isKat{
        for level in levels{
            hir += Info.hirNEW1[level]
            rom += Info.romNEW1[level]
        }
        questions = [hir,rom]
    }
    
    
    
    return questions
}
