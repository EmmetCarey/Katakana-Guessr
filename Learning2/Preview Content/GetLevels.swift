//
//  GetLevels.swift
//  Learning2
//
//  Created by Emmet Carey on 13/06/2023.
//

import Foundation

let katTest1 = Info.kat_vowels
let katTest2 = katTest1 + Info.kat_k
let katTest3 = katTest2 + Info.kat_s
let katTest4 = katTest3 + Info.kat_t
let katTest5 = katTest4 + Info.kat_n
let katTest6 = katTest5 + Info.kat_h
let katTest7 = katTest6 + Info.kat_m
let katTest8 = katTest7 + Info.kat_r

let hirTest1 = Info.hir_vowels
let hirTest2 = hirTest1 + Info.hir_k
let hirTest3 = hirTest2 + Info.hir_s
let hirTest4 = hirTest3 + Info.hir_t
let hirTest5 = hirTest4 + Info.hir_n
let hirTest6 = hirTest5 + Info.hir_h
let hirTest7 = hirTest6 + Info.hir_m
let hirTest8 = hirTest7 + Info.hir_r

let romTest1 = Info.rom_vowels
let romTest2 = romTest1 + Info.rom_k
let romTest3 = romTest2 + Info.rom_s
let romTest4 = romTest3 + Info.rom_t
let romTest5 = romTest4 + Info.rom_n
let romTest6 = romTest5 + Info.rom_h
let romTest7 = romTest6 + Info.rom_m
let romTest8 = romTest7 + Info.rom_r

let katQ1 = [katTest1, romTest1]
let katQ2 = [katTest2, romTest2]
let katQ3 = [katTest3, romTest3]
let katQ4 = [katTest4, romTest4]
let katQ5 = [katTest5, romTest5]
let katQ6 = [katTest6, romTest6]
let katQ7 = [katTest7, romTest7]
let katQ8 = [katTest8, romTest8]

let hirQ1 = [hirTest1, romTest1]
let hirQ2 = [hirTest2, romTest2]
let hirQ3 = [hirTest3, romTest3]
let hirQ4 = [hirTest4, romTest4]
let hirQ5 = [hirTest5, romTest5]
let hirQ6 = [hirTest6, romTest6]
let hirQ7 = [hirTest7, romTest7]
let hirQ8 = [hirTest8, romTest8]

let katTestArray = [katQ1,katQ2,katQ3,katQ4,katQ5,katQ6,katQ7,katQ8]
let hirTestArray = [hirQ1, hirQ2, hirQ3, hirQ4, hirQ5, hirQ6, hirQ7, hirQ8]

func getQuestions(isKat: Bool,level: Int) -> [[String]] {

    if isKat{
        return katTestArray[level]
    }
    else{
        return hirTestArray[level]
    }
    
}


