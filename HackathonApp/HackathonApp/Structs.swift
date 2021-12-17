import Foundation

var placesArr:[Places] = [
    
    Places(name: "منتزه الملك سلمان البري", description: "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض ", coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي حنيفة", description: "يعد من أفضل الأماكن السياحية في السعودية ومن أهم منتزهات الرياض", coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي السلي", description: "  يقع في منطقة الرياض بالمملكة العربية السعودية يبلغ طوله 103 كليومترات", coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي نمار", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "منتزه الملك سلمان البري", description: "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض "
           , coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي حنيفة", description: "يعد من أفضل الأماكن السياحية في السعودية ومن أهم منتزهات الرياض"
           , coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي السلي", description: "  يقع في منطقة الرياض بالمملكة العربية السعودية يبلغ طوله 103 كليومترات"
           , coord: Coordinates(long: 1000, lat: 1000)),
    Places(name: "وادي نمار", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض"
           , coord: Coordinates(long: 1000, lat: 1000))
    
]

var suppliesArr:[Supplies] = [
    
    Supplies(name: "جامعة الاميرة نورة - كلية الزراعه و علوم الارض", description: "بذور شجرة السدر", amount: 600, coord: Coordinates(long: 1000, lat: 1000)),
    Supplies(name: "جامعة الاميرة نورة - كلية الزراعه و علوم الارض", description: "بذور شجرة السدر"
             , amount: 600, coord: Coordinates(long: 1000, lat: 1000)),
    Supplies(name: "جامعة الملك سعود", description: "", amount: 10, coord: Coordinates(long: 1000, lat: 1000)),
    Supplies(name: "جامعة الامام محمد بن سعود", description: "", amount: 10, coord: Coordinates(long: 1000, lat: 1000)),
    Supplies(name: "أمانة منطقة الرياض", description: "", amount: 10, coord: Coordinates(long: 1000, lat: 1000))
]

var waterArr : [WaterContainer] = [
    WaterContainer(name: "محطة تحلية المياه-النرجس", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 1000, lat: 1000)),
    WaterContainer(name: "محطة تحلية المياة-جنوب الرياض", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 1000, lat: 1000)),
    WaterContainer(name: "محطة تحلية المياه-السويدي", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 1000, lat: 1000)),
]

struct Supplies {
    var name:String
    var description:String
    var amount : Int
    var coord : Coordinates
}

struct WaterContainer{
    var name:String
    var description:String
    var coord : Coordinates
    
}



struct Places {
    var name:String
    var description:String
    var coord : Coordinates
}

struct Coordinates {
    var  long : Float
    var   lat : Float
}
