import Foundation

var placesArr:[Places] = [
    
   
    Places(name: "منتزه الملك سلمان البري", description: "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض ", coord: Coordinates(long: 46.5998408, lat: 25.0079899)),
    Places(name: "وادي حنيفة", description: "يعد من أفضل الأماكن السياحية في السعودية ومن أهم منتزهات الرياض", coord: Coordinates(long: 46.7049941, lat: 24.5936340)),
    Places(name: "وادي السلي", description: "  يقع في منطقة الرياض بالمملكة العربية السعودية يبلغ طوله 103 كليومترات", coord: Coordinates(long: 46.8830451, lat: 24.6883262)),
    Places(name: "وادي نمار", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 46.6790206, lat: 24.5685229))
    
]

var suppliesArr:[Supplies] = [
    
    Supplies(name: "جامعة الاميرة نورة - كلية الزراعه و علوم الارض", description: "بذور شجرة السدر", amount: 600, coord: Coordinates(long: 46.710210, lat: 24.858659)),
    Supplies(name: "جامعة الملك سعود", description: "", amount: 10, coord: Coordinates(long: 46.6191078, lat: 24.7257277)),
    Supplies(name: "جامعة الامام محمد بن سعود", description: "", amount: 10, coord: Coordinates(long: 46.6962513, lat: 24.8149349)),
    Supplies(name: "أمانة منطقة الرياض", description: "", amount: 10, coord: Coordinates(long: 46.7368614, lat: 24.6722271))
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
