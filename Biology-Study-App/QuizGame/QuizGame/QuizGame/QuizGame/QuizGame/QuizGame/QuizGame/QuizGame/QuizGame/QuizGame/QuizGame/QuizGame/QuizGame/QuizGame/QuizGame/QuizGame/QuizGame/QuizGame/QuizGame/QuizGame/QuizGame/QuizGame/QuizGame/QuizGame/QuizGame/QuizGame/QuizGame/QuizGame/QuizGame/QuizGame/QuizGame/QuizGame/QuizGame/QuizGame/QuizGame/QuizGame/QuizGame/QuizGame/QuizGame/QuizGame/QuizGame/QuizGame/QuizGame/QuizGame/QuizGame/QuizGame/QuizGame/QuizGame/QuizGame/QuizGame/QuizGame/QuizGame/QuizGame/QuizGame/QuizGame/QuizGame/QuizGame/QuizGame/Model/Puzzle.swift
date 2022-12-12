//
//  Puzzle.swift
//  QuizGame
//
//  Created by blaze Wheeler on 2/18/22.
//

import SwiftUI

// MARK: Puzzle Model And Sample Puzzles

struct Puzzle: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var answer: String
    var jumbbledWord: String
    var place : Int
    
    //MARK: Spiliting Jumbbled Word Into Array Of Indentifiable Characters
    var letters: [Letter] = []
}
struct Letter: Identifiable{
    var id = UUID().uuidString
    var value: String
    
}

var puzzles : [Puzzle] = [
    // MARK: LEVEL 1 START
    Puzzle(imageName: "Evolution", answer: "Evolution", jumbbledWord: "LVUIOTNOE", place: 0),
    Puzzle(imageName: "Natural", answer: "Natural", jumbbledWord: "WATAUTZRLNG", place: 1),
    Puzzle(imageName: "Population", answer: "Population", jumbbledWord: "POPULATIONU", place: 2),
    Puzzle(imageName: "Taxonomy", answer: "Taxonomy", jumbbledWord: "NOAOXYMTIQF", place: 3),
    Puzzle(imageName: "Heterozygous", answer: "Heterozygous", jumbbledWord: "OGRUOTHEZESY", place: 4),
    Puzzle(imageName: "Homozygous", answer: "Homozygous", jumbbledWord: "USHOGMOOYZW", place: 5),
    Puzzle(imageName: "Locus", answer: "Locus", jumbbledWord: "SLCOUEP", place: 6),
    Puzzle(imageName: "Phenotype", answer: "Phenotype", jumbbledWord: "YPETENPHO", place: 7),
    Puzzle(imageName: "Diploid", answer: "Diploid", jumbbledWord: "IODPDLI", place: 8),
    Puzzle(imageName: "Genotype", answer: "Genotype", jumbbledWord: "POENTEGYQAG", place: 9),
    // MARK: LEVEL 2 START
    Puzzle(imageName: "Allele", answer: "Allele", jumbbledWord: "LEALALOULFE", place: 10),
    Puzzle(imageName: "Geneflow", answer: "Geneflow", jumbbledWord: "VNLRYGEFWOE", place: 11),
    Puzzle(imageName: "Hemizygous", answer: "Hemizygous", jumbbledWord: "IMWZUEGYHOS", place: 12),
    Puzzle(imageName: "Founder", answer: "Founder", jumbbledWord: "DNATREUOF", place: 13),
    Puzzle(imageName: "Homology", answer: "Homology", jumbbledWord: "YOLMOGOHR", place: 14),
    Puzzle(imageName: "Inbreeding", answer: "Inbreeding", jumbbledWord: "NDISGREBNIE", place: 15),
    Puzzle(imageName: "Inbreeding", answer: "Inbreeding", jumbbledWord: "NDIGREBYNIE", place: 16),
    Puzzle(imageName: "Genepool", answer: "Genepool", jumbbledWord: "EPNEOTLOGBV", place: 17),
    Puzzle(imageName: "Bottleneck", answer: "Bottleneck", jumbbledWord: "CLTTONKVEBE", place: 18),
    Puzzle(imageName: "Drift", answer: "Drift", jumbbledWord: "YDSIDFFWRXT", place: 19),
    // MARK: LEVEL 3 START
    Puzzle(imageName: "Fitness", answer: "Fitness", jumbbledWord: "UTEIFNSYXBS", place: 20),
    Puzzle(imageName: "Directional", answer: "Directional", jumbbledWord: "DICNOTIEALR", place: 21),
    Puzzle(imageName: "Sexual", answer: "Sexual", jumbbledWord: "UXJTYSLAEWJ", place: 22),
    Puzzle(imageName: "Distruptive", answer: "Disruptive", jumbbledWord: "DPURVIEITSF", place: 23),
    Puzzle(imageName: "Stabilizing", answer: "Stabilizing", jumbbledWord: "ISITGZBNAIL", place: 24),
    Puzzle(imageName: "Speciation", answer: "Speciation", jumbbledWord: "ICITSOEYNPA", place: 25),
    Puzzle(imageName: "Biological", answer: "Biological", jumbbledWord: "OOLLIZCAIGB", place: 26),
    Puzzle(imageName: "Allopatric", answer: "Allopatric", jumbbledWord: "IAOCRBPLTLA", place: 27),
    Puzzle(imageName: "Sympatric", answer: "Sympatric", jumbbledWord: "TAYSRCPIM", place: 28),
    Puzzle(imageName: "Vicariance", answer: "Vicariance", jumbbledWord: "AANEICCIRAV", place: 29)
    // MARK: LEVEL 4 START
    // Change to harder level in the future 
    
    // Harder Levels
    //Puzzle(imageName: "Microevolution", answer: "Microevolution", jumbbledWord: "ieicouovrtomnl", place: *)
    
    //Puzzle(imageName: "Haploid", answer: "Haploid", jumbbledWord: "OADHPIL", place: *)

]
