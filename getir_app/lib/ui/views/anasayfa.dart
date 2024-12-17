import 'package:flutter/material.dart';
import 'package:getir_app/data/entity/categories.dart';
import 'package:getir_app/data/entity/product.dart';
import 'package:getir_app/values/renkler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    var screenInfo=MediaQuery.of(context);
    var widht=screenInfo.size.width;
    return Scaffold(
      appBar:AppBar(
        title:Image.asset("resimler/logo.png",height: 35,),
        backgroundColor: mainColor,
        centerTitle: true,),
      body:Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                          itemCount: banners.length,
                          controller: PageController(viewportFraction: 0.925),// kenarlarda kart efekti
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: ClipRRect(borderRadius: BorderRadius.circular(12.0),child: Image.network(banners[index], fit: BoxFit.cover,)),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 610,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: FutureBuilder<List<Categories>>(
                          future: getCategories(),
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              var categoryList=snapshot.data;
                              return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(), // Kaydırmayı engeller
                                  itemCount: categoryList!.length,
                                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                                      childAspectRatio: 1/1.20),
                                  itemBuilder: (context,pos){
                                    var category=categoryList[pos];
                                    return Center(
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text(category.title))
                                              );
                                            },
                                            child: Card(
                                              child:SizedBox(width:85,height: 85,
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(category.image))),
                                            ),
                                          ),
                                          Text(category.title, style:const TextStyle(fontSize: 12.5,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    );
                                  });
                            }else{
                              return const Center();
                            }

                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text("Sana Seçtiğimiz Paketler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                        Icon(Icons.star, color: yellow,),
                        Spacer(),
                        Text("Tümü>",style: TextStyle(color: mainColor),)
                      ],
                    ),
                  ),
                  SizedBox(height: 240,
                    child: FutureBuilder(future: getProducts(), builder: (context,snapshot){
                      if(snapshot.hasData){
                        var productList=snapshot.data;
                        return ListView.builder(
                            itemCount: productList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context,pos){
                              var product=productList[pos];
                              return Container(width: 125, height: 220, margin: const EdgeInsets.only(top: 16,left: 8,right: 8,bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,//taşma olduğu zaman görüntünün görünmesinin engellenmesini kaldırır
                                      alignment: Alignment.center,
                                      children: [
                                        Container(width: 110, height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.grey, width: 1),
                                          ),
                                          child: Center(
                                            child: Image.network("${product.image}", width: 80, height: 80,),
                                          ),
                                        ),
                                        Positioned(
                                          top: -15, // İkonun dışa taşması için negatif değer
                                          right: -15,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            elevation: 5,
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Colors.white30, width: 1),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 25,
                                                  color: mainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${product.price} ₺", style: TextStyle(fontWeight: FontWeight.bold, color: mainColor,)),
                                          const SizedBox(height: 4),
                                          Text("${product.title}", style: const TextStyle(fontSize: 12,)),
                                          const SizedBox(height: 2),
                                          Text("${product.alt}", style: const TextStyle(fontSize: 12, color: Colors.grey,),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } );
                      }else{
                        return const Center();
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text("Tekrar Al",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                        Icon(Icons.shopping_cart, color: mainColor,),
                        Spacer(),
                        Text("Tümü>",style: TextStyle(color: mainColor),)
                      ],
                    ),
                  ),
                  SizedBox(height: 240,
                    child: FutureBuilder(future: getTakeItAgain(), builder: (context,snapshot){
                      if(snapshot.hasData){
                        var productList=snapshot.data;
                        return ListView.builder(
                            itemCount: productList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context,pos){
                              var product=productList[pos];
                              return Container(width: 125, height: 220, margin: const EdgeInsets.only(top: 16,left: 8,right: 8,bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,//taşma olduğu zaman görüntünün görünmesinin engellenmesini kaldırır
                                      alignment: Alignment.center,
                                      children: [
                                        Container(width: 110, height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.grey, width: 1),
                                          ),
                                          child: Center(
                                            child: Image.network("${product.image}", width: 80, height: 80,),
                                          ),
                                        ),
                                        Positioned(
                                          top: -15, // İkonun dışa taşması için negatif değer
                                          right: -15,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            elevation: 5,
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Colors.white30, width: 1),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 25,
                                                  color: mainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${product.price} ₺", style: TextStyle(fontWeight: FontWeight.bold, color: mainColor,)),
                                          const SizedBox(height: 4),
                                          Text("${product.title}", style: const TextStyle(fontSize: 12,)),
                                          const SizedBox(height: 2),
                                          Text("${product.alt}", style: const TextStyle(fontSize: 12, color: Colors.grey,),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } );
                      }else{
                        return const Center();
                      }
                    }),
                  ),
                ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: yellow,
              child: Row(
                children: [
                  SizedBox(
                    width:widht*0.8,
                    height: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(16))),
                      child:  Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 20,
                                child: Text("Ev,",style: TextStyle(fontSize: 13,color: mainColor,fontWeight: FontWeight.bold),)),
                            const Padding(
                              padding: EdgeInsets.only(right: 16,left: 16),
                              child: Expanded(
                                  flex: 6,
                                  child: Text("Mimar sinan, Atatürk Cd. No1,..",style: TextStyle(fontSize: 13,color: Colors.black),)),
                            ),
                            Expanded(flex: 20,child: Icon(Icons.arrow_drop_down,color: mainColor,))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:widht*0.2,
                    height: 50,
                    child: Container(
                      color: yellow,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Text("TVS",style: TextStyle(fontSize: 13,color: mainColor,fontWeight: FontWeight.bold),),
                            Text("20-30 dk",style: TextStyle(fontSize: 13,color: mainColor),),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 64,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Anasayfa"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Arama"),
            BottomNavigationBarItem(icon: Icon(null),label: "null"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profil"),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: "Kampanyalar"),
          ],
          iconSize: 30,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: selected_index,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              if(index!=2){
                selected_index=index;
              }
            });
          }
        ),
      ),
      floatingActionButton: ClipOval(
        child: SizedBox(width: 65,height: 65,
          child: FloatingActionButton(
            backgroundColor: mainColor,
            child: SizedBox(width: 65,height: 65,child: Image.asset("resimler/ic_fab.png")),
            onPressed: (){

            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }


  final List<String> banners = [
    "https://cdn.getir.com/misc/611e55d33ea65bef40f9ba05_banner_tr_1629378026496.jpeg",
    "https://cdn.getir.com/misc/611e4a50c270af509cd486b5_banner_tr_1629375115516.jpeg",
    "https://cdn.getir.com/misc/5fb524d4c725f1530045cefc_banner_tr_1609343376255.jpeg",
    "https://cdn.getir.com/misc/6069cee3f7be2b6472dc8b5f_banner_tr_1629921878792.jpeg"
  ];

  Future<List<Categories>> getCategories() async{
    return[
      Categories(1,"Yeni Ürünler","http://cdn.getir.com/cat/5697c78dc181490f00c99fea_f7ef7ccb-f3a4-4388-b787-232967c16320.jpeg"),
      Categories(2,"İndirimler","http://cdn.getir.com/cat/5fd8c58f3bdc2389a56e0fb0_3322c10f-2eed-4ce9-ab5a-90db5ce067f2.jpeg"),
      Categories(3,"Su & İçecek","http://cdn.getir.com/cat/551430043427d5010a3a5c5e_1619242669958_1619242670038.jpeg"),
      Categories(4,"Meyve & Sebze","http://cdn.getir.com/cat/5928113e616cab00041ec6de_1619242870968_1619242871055.jpeg"),
      Categories(5,"Fırından","http://cdn.getir.com/cat/566eeb85f9facb0f00b1cb16_1619242817768_1619242817849.jpeg"),
      Categories(6,"Temel Gıda","http://cdn.getir.com/cat/56dfcfba86004203000a870d_1619242834654_1619242834734.jpeg"),
      Categories(7,"Atıştırmalık","http://cdn.getir.com/cat/56dfe03cf82055030022cdc0_1619242841966_1619242842053.jpeg"),
      Categories(8,"Dondurma","http://cdn.getir.com/cat/55bca8484dcda90c00e3aa80_1619242741382_1619242741482.jpeg"),
      Categories(9,"Yiyecek","http://cdn.getir.com/cat/551430043427d5010a3a5c5d_1619242660025_1619242660107.jpeg"),
      Categories(10,"Süt & Kahvaltı","http://cdn.getir.com/cat/56dfed05ab747f03008d9379_1619242850313_1619242850394.jpeg"),
      Categories(11,"Fit & Form","http://cdn.getir.com/cat/57e2996551f3ee030027e28b_1619242858559_1619242858642.jpeg"),
      Categories(12,"Kişisel Bakım","http://cdn.getir.com/cat/551430043427d5010a3a5c5c_1619242651249_1619242651335.jpeg"),
      Categories(13,"Ev Bakım","http://cdn.getir.com/cat/55449fdf02632e11003c2da8_1619242719523_1619242719602.jpeg"),
      Categories(14,"Ev & Yaşam","http://cdn.getir.com/cat/5b06b056b883b700044e3e4c_1619242916956_1619242917048.jpeg"),
      Categories(15,"Teknoloji","http://cdn.getir.com/cat/551430043427d5010a3a5c62_1619242697597_1619242697702.jpeg"),
      Categories(16,"Evcil Hayvan","http://cdn.getir.com/cat/551430043427d5010a3a5c63_1619242711604_1619242711687.jpeg"),
      Categories(17,"Bebek","http://cdn.getir.com/cat/551430043427d5010a3a5c5b_1619242620186_1619242620271.jpeg"),
      Categories(18,"Cinsel Sağlık","http://cdn.getir.com/cat/559c07b093be370c0063dd29_1619242727735_1619242727816.jpeg"),
      Categories(19,"Giyim","http://cdn.getir.com/cat/551430043427d5010a3a5c5f_1619242679723_1619242679822.jpeg")
    ];
  }

  Future<List<Product>> getProducts() async{
    return[
      Product(1,"Lay's Mevsim Yeşillikli","https://cdn.getir.com/product/5bc97aabb137fb001d751ac7_tr_1609123518121.jpeg","96 g",6.36),
      Product(2,"Eti Canga","https://cdn.getir.com/product/5f3538dc71a71226677fba17_tr_1624437105104.jpeg","45 g",2.85),
      Product(3,"Kuzeyden","https://cdn.getir.com/product/5a7b20fd8e19da0004bb27f8_tr_1615375864268.jpeg","1.5 L",2.95),
      Product(4,"Kızılay Erzincan","https://cdn.getir.com/product/60018c5bca2126d84459c47f_tr_1610788125046.jpeg","6 x 200 ml",5.9),
      Product(5,"Ülker Napoliten","https://cdn.getir.com/product/574b2219dee8a90300f18d24_tr_1599938278519.jpeg","33 g",3.3),
      Product(6,"Kavrulmuş Siyah Ay Çekirdeği","https://cdn.getir.com/product/5ccaf4ff1a1763000175a869_tr_1580904995656.jpeg","180 g",10.95),
      Product(7,"Magnum Badem","https://cdn.getir.com/product/559fec01f462100c00461d5c_tr_1618323765236.jpeg","100 ml",7.5),
      Product(8,"İçim %3 Yağlı Süt","https://cdn.getir.com/product/5ced482d4a8a2a000137da6d_tr_1623652387464.jpeg","1 L",7.95),
    ];
  }
  Future<List<Product>> getTakeItAgain() async{
    return[
      Product(7,"Magnum Badem","https://cdn.getir.com/product/559fec01f462100c00461d5c_tr_1618323765236.jpeg","100 ml",7.5),
      Product(8,"İçim %3 Yağlı Süt","https://cdn.getir.com/product/5ced482d4a8a2a000137da6d_tr_1623652387464.jpeg","1 L",7.95),
      Product(4,"Kızılay Erzincan","https://cdn.getir.com/product/60018c5bca2126d84459c47f_tr_1610788125046.jpeg","6 x 200 ml",5.9),
      Product(3,"Kuzeyden","https://cdn.getir.com/product/5a7b20fd8e19da0004bb27f8_tr_1615375864268.jpeg","1.5 L",2.95),
      Product(5,"Ülker Napoliten","https://cdn.getir.com/product/574b2219dee8a90300f18d24_tr_1599938278519.jpeg","33 g",3.3),
      Product(1,"Lay's Mevsim Yeşillikli","https://cdn.getir.com/product/5bc97aabb137fb001d751ac7_tr_1609123518121.jpeg","96 g",6.36),
      Product(2,"Eti Canga","https://cdn.getir.com/product/5f3538dc71a71226677fba17_tr_1624437105104.jpeg","45 g",2.85),
      Product(6,"Kavrulmuş Siyah Ay Çekirdeği","https://cdn.getir.com/product/5ccaf4ff1a1763000175a869_tr_1580904995656.jpeg","180 g",10.95),

    ];
  }

}
