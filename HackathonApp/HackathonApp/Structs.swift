import Foundation

var placesArr:[Places] = [
    
   
    Places(name: "منتزه الملك سلمان البري", description: "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض، يمتاز بخصوبة الارض وهي بيئة ممتازه للزراعه ", coord: Coordinates(long: 46.5998408, lat: 25.0079899)),
    Places(name: "وادي حنيفة", description: "من اكثر الاودية تعرض للامطار ممايجعله موقع ممتاز للزراعه", coord: Coordinates(long: 46.7049941, lat: 24.5936340)),
    Places(name: "وادي السلي", description: "  يقع في منطقة الرياض بالمملكة العربية السعودية يبلغ طوله 103 كليومترات", coord: Coordinates(long: 46.8830451, lat: 24.6883262)),
    Places(name: "وادي نمار", description: "يعد من المعالم السياحية الأشهر والأكثر جذبا لزوار وسياح العاصمة الرياض", coord: Coordinates(long: 46.6790206, lat: 24.5685229))
    
]

var suppliesArr:[Supplies] = [
    
    Supplies(name: "جامعة الاميرة نورة - كلية الزراعه و علوم الارض", description: "بذور شجرة السدر", amount: 600, coord: Coordinates(long: 46.710210, lat: 24.858659)),
    Supplies(name: "جامعة الملك سعود", description: "بذور الترنج", amount: 10, coord: Coordinates(long: 46.6191078, lat: 24.7257277)),
    Supplies(name: "جامعة الامام محمد بن سعود", description: "بذور الياسمين الأحمر", amount: 10, coord: Coordinates(long: 46.6962513, lat: 24.8149349)),
    Supplies(name: "أمانة منطقة الرياض", description: "بذور شجرة التين", amount: 10, coord: Coordinates(long: 46.7368614, lat: 24.6722271))
]


var waterArr : [WaterContainer] = [
    WaterContainer(name: "محطة تحلية المياه-النرجس", description: "تستقبل المحطة جميع انواع السوائل لاجل اعادة تدويرها و استخدامها", coord: Coordinates(long: 1000, lat: 1000)),
    WaterContainer(name: "محطة تحلية المياة-جنوب الرياض", description: "فلترة المياه و تصفيتها للزراعة", coord: Coordinates(long: 1000, lat: 1000)),
    WaterContainer(name: "محطة تحلية المياه-السويدي", description: "تحلي المياة الجوفية للزراعة", coord: Coordinates(long: 1000, lat: 1000)),
]


var Articles : [Article] = [

    Article(name: "مبادرة السعودية الخضراء",
            content: " من خلال إطلاق نشر وتكثيف التشجير في كافة عناصر المدينة ومختلف أرجائها، مع تحقيق الاستغلال الأمثل للمياه المعالجة في أعمال الري، بما يساهم في تحسين جودة الهواء وخفض درجات الحرارة في المدينة، وتشجيع السكان على ممارسة نمط حياة أكثر نشاطاً وحيوية بما ينسجم مع أهداف توجهات “رؤية المملكة 2030 ."
           ),
    Article(name: "خطورة انبعاثات الكربون", content:  "تسعى السعودية لزراعة عشرة مليارات شجرة خلال العقود القادمة في إطار حملة طموحة كشف عنها ولي العهد الأمير محمد بن سلمان لخفض انبعاثات الكربون ومكافحة التلوث وتدهور الأراضي وقال الأمير محمد إن السعودية تستهدف خفض انبعاثات الكربون “وذلك من خلال مشاريع الطاقة المتجددة التي ستوفر 50 بالمئة من إنتاج الكهرباء داخل المملكة بحلول عام 2030 ."
           
           ),
    Article(name: " اهداف المبادرة", content:  """
تجمع مبادرة السعودية الخضراء بين حماية البيئة، وتحويل الطاقة، وبرامج الاستدامة لتحقيق ثلاثة أهداف شاملة ترمي إلى بناء مستقبل مستدام للجميع من خلال تقليل الانبعاثات الكربونية وتشجير مساحات من المملكة، وحماية المناطق البرية والبحرية.

وفي جانب الطاقة يُعد خفض انبعاثات الكربون أمراً بالغ الأهمية لإبطاء آثار التغير المناخي وإعادة التوازن البيئي، إذ تبذل المملكة جهوداً حثيثة لتعزيز وتوحيد جهود مكافحة أزمة المناخ تحت مظلة مبادرة السعودية الخضراء من خلال تنفيذ مجموعة متنامية من مشاريع الطاقة المتجددة، وتقليل الانبعاثات الكربونية بأكثر من 4% من الإسهام العالمي من خلال توفير 50% من إنتاج الكهرباء من خلال مشاريع الطاقة المتجددة بحلول عام 2030، وإزالة حوالي 130 مليون طن من الانبعاثات الكربونية من خلال تنفيذ العديد من المشاريع في مجال التقنية الهيدروكربونية النظيفة
"""
           
           ),
    Article(name: " جهود حماية المناخ ", content:  """

تحمل مبادرة “السعودية الخضراء” في مستهدفاتها تأكيداً لدور المملكة الريادي وعملها على أحداث نقلة نوعية داخلياً وإقليمياً تجاه التغير المناخي لبناء مستقبل أفضل وتحسين مستوى جودة الحياة.

ومنذ إطلاق رؤية المملكة 2030 في عام 2016، بذلت المملكة جهوداً فاعلة لحماية البيئة وتقليل آثار التغير المناخي، وسيسهم منتدى مبادرة السعودية الخضراء الذي تحتضنه الرياض يوم السبت القادم على توحيد جميع الخطط الرامية إلى تحقيق الاستدامة في المملكة، وزيادة الاعتماد على الطاقة النظيفة وتخفيض انبعاثات الكربون ومكافحة التغير المناخي



"""
           
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
