//
//  Structs.swift
//  HackathonApp
//
//  Created by Najla Talal on 12/16/21.
//

import Foundation

var placesArr:[Places] = [
    
    Places(name: "منتزه الملك سلمان البري", description: "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض "),
    Places(name: "وادي حنيفة", description: "يعد من أفضل الأماكن السياحية في السعودية ومن أهم منتزهات الرياض"),
    Places(name: "وادي السلي", description: "  يقع في منطقة الرياض بالمملكة العربية السعودية يبلغ طوله 103 كليومترات"),
    Places(name: "وادي نمار", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض")
    
]

var suppliesArr:[Supplies] = [
    
    Supplies(name: "جامعة الأميرة نورة", description: ""),
    Supplies(name: "جامعة الملك سعود", description: ""),
    Supplies(name: "جامعة الامام محمد بن سعود", description: ""),
    Supplies(name: "أمانة منطقة الرياض", description: "")
]

struct Supplies {
    var name:String
    var description:String
    init(name:String, description:String){
    self.name = name
    self.description = description
    
}
}



struct Places {
    var name:String
    var description:String
    init(name:String, description:String){
    self.name = name
    self.description = description
    
}
}
