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


var Articles : [Article] = [

    Article(name: "مبادرة السعودية الخضراء",
            content: " من خلال إطلاق نشر وتكثيف التشجير في كافة عناصر المدينة ومختلف أرجائها، مع تحقيق الاستغلال الأمثل للمياه المعالجة في أعمال الري، بما يساهم في تحسين جودة الهواء وخفض درجات الحرارة في المدينة، وتشجيع السكان على ممارسة نمط حياة أكثر نشاطاً وحيوية بما ينسجم مع أهداف توجهات “رؤية المملكة 2030 ."
           ),
    Article(name: "خطورة انبعاثات الكربون", content:  "تسعى السعودية لزراعة عشرة مليارات شجرة خلال العقود القادمة في إطار حملة طموحة كشف عنها ولي العهد الأمير محمد بن سلمان لخفض انبعاثات الكربون ومكافحة التلوث وتدهور الأراضي وقال الأمير محمد إن السعودية تستهدف خفض انبعاثات الكربون “وذلك من خلال مشاريع الطاقة المتجددة التي ستوفر 50 بالمئة من إنتاج الكهرباء داخل المملكة بحلول عام 2030 ."
           
           )

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


struct Article {
    
    var name  :String
    var content : String
    
}
