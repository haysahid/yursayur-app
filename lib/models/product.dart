class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final String? unit;
  final String? category;
  final List<String>? productImages;
  final List<String>? tags;

  const ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.unit,
    this.category,
    this.productImages,
    this.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      unit: json['unit'],
      category: json['category'],
      productImages: json['product_images']
          .map<String>((dynamic e) => e.toString())
          .toList(),
      tags: json['tags'].map<String>((dynamic e) => e.toString()).toList(),
    );
  }
}

final productList = productsRaw.map((e) => ProductModel.fromJson(e)).toList();

final productsRaw = [
  {
    "id": 14,
    "name": "Mangga Manis",
    "description":
        "Mangga pilihan berkualitas. Dijamin manis dan daging buahnya tebal. Cocok untuk jus, salad, rujak, dll.",
    "price": 28000,
    "unit": "kg",
    "category": "Buah",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/pZjK1rs0fBLoKbyisk8CbWhszgZR2Rb3uvA6LXt2.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/kmSoMQpO9C7Xfw9EGzyxeqYK9mOMK0hYSGli8CTh.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/16i1OokYQjtZYrGu7rRvzHUriEZ33f21lsvuycR5.jpg",
    ],
    "tags": ["mangga", "manis"]
  },
  {
    "id": 13,
    "name": "Rambutan",
    "description":
        "Rambutan merah manis lembut, bermanfaat sebagai pencegah anemia dan dapat membantu menurunkan berat badan.",
    "price": 30000,
    "unit": "kg",
    "category": "Buah",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/Fi2gXsz83GRmYU8eWmFuuKfDBfG5xLfVI31RUNDs.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/ICu9RGOXBSxFdWb5vNFfHmcgPfkZbFhbBl5KdRg9.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/aMKSx4Sql1paoxFBcv2RIDAKoO24nogJ4HDcF89M.jpg",
    ],
    "tags": ["rambutan", "manis"]
  },
  {
    "id": 12,
    "name": "Jeruk Manis",
    "description":
        "Jeruk manis yang bermanfaat sebagai antioksidan dan anti inflamasi. Dipanen langsung dari kebun.",
    "price": 25500,
    "unit": "kg",
    "category": "Buah",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/HwmNhR2Q347M4DKVglXoiEsNOeH4qpCfvDkdxUm2.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/y1fZ6ZY0eNwfn8jpMBmoGJII2GGcwHS1QGAxBrCB.webp",
      "https://yursayur.alwaysdata.net/storage/store/1/product/68PEfpINEKm4yK34pryxAE9ckXggG8FgJtrwkpXC.jpg",
    ],
    "tags": ["jeruk", "segar", "manis"]
  },
  {
    "id": 11,
    "name": "Strawberry",
    "description":
        "Strawberry kemasam 1kg menggunakan mika aman. Bermanfaat sebagai antioksidan dan peningkat imunitas tubuh.",
    "price": 40000,
    "unit": "kg",
    "category": "Buah",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/TexvitLQTDI9ketQW4EC8HqQOgzTisnZgfb07VPx.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/wALPT5CSQAOE5fEmNQ0ge6iaNycMpLRjCtWsW7FE.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/IJX9VZTXcOYuMhMSdl4x8L8bSbRahhH347jvUeZU.jpg",
    ],
    "tags": ["strawberry", "segar"]
  },
  {
    "id": 10,
    "name": "Bayam",
    "description":
        "Sayur Bayam dengan kemasan 250gr. Bermanfaat sebagai penyegah kanker, memperkuat otot, dan menjaga tekanan darah.",
    "price": 5000,
    "unit": "250 gram",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/YzZIwQa1gpxMBUMdFwrgnHLzZ5z0NJpGrcDZsXlr.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/0TD2tkMtskfh9AkPWzFakdcLLcH3n5OTqaExLzsm.webp",
      "https://yursayur.alwaysdata.net/storage/store/1/product/8Ad6mwbY5fpW5v6Z4nHMpt84iul239BRb29NGfIw.webp"
    ],
    "tags": ["bayam", "segar", "hijau"]
  },
  {
    "id": 9,
    "name": "Daun Bawang",
    "description":
        "Dibungkus dalam kemasan 500gr. Bermanfaat sebagai pencegah anemia, mengatasi asma, dan mencegah penyakit jantung.",
    "price": 11500,
    "unit": "500 gram",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/PeqADQS2IZGZWiN2BLFE4Zn8QBTziG0C57ob7IAr.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/gdJN4Clfe4t9Vc3qMgGZggS9IDVlDWww9MJY7PV9.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/n2F07CdAqGTAJdNh5431h6l2BSTWaucbtI4AAWXM.jpg",
    ],
    "tags": [
      "daun bawang",
      "segar",
      "hijau",
      "bawang",
    ]
  },
  {
    "id": 8,
    "name": "Seledri",
    "description":
        "Sayuran yang berada dalam kemasan 500gr ini memiliki manfaat sebagai berikut:\n- Mencegah peradangan\n- Mencegah dehidrasi\n- Menurunkan kadar kolesterol",
    "price": 17500,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/1vl5OzGflI32KwJGW8aEDUPUhgfzq9I61Y69M24e.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/u9QlbcsTRTx43FTL7xppQb9yZqegbGkacnhlrZIZ.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/kiZuxpRCDC5CydIPjPeEWIjsnZAmwwLXQtsSySKr.jpg",
    ],
    "tags": ["seledri", "segar", "hijau"]
  },
  {
    "id": 7,
    "name": "Kembang Kol",
    "description":
        "Sayuran Kembang Kol bermanfaat untuk mengobati sariawan, batuk berdahak, dan cacar air.",
    "price": 18000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/JbGY5ep2TOuaNq7hjNIrIii20ASibDe2GDM0KLUJ.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/bauWpi2VVEdnAHhlAsYdBUJ9drv4J3rmGKhW60Kd.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/c89tzU8djqZ5gW5l51YM7SnNx2I11qBz6QUMhDx0.jpg",
    ],
    "tags": ["kembang kol", "segar", "muda", "bunga kol"]
  },
  {
    "id": 6,
    "name": "Jagung Manis",
    "description":
        "Tersedia dalam kemasan 1kg, yursayur menyediakan jagung segar manis dengan manfaat:\n- Meningkatkan kepadatan tulang\n- Melancarkan saluran pencernaan\n- Baik untuk kesehatan jantung",
    "price": 12000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/0v1I75JRvtig5ixg3TjSKDgFjeVdIYDFr3KO9RNV.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/sv42JrF9Mxa6uzYNoQzJZEC3ICBIynTUKuEBrY5w.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/mV8BpeADNKT0yKYkrLS4y55bZAeOsdQ537v2ZQyq.jpg",
    ],
    "tags": ["jagung manis", "segar", "muda"]
  },
  {
    "id": 5,
    "name": "Kubis",
    "description":
        "Sayur Kubis, bermanfaat bagi mereka yang ingin menurunkan tekanan darah dan kolesterol. Dipanen langsung dari kebun petani.",
    "price": 10000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/gbe1Hun4WmIfyzyeYKGE39BEUrhhkZgACwIgpKGW.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/Hty6z79L2zS7WAf4gSUokg6v7IjCl343zZLAgO3z.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/BdIyaUBD8vqhdrfWa8ayK3ZRvUeWE9Whd4gkd3Tt.webp",
    ],
    "tags": ["kubis", "jumbo", "segar", "kol"]
  },
  {
    "id": 4,
    "name": "Bawang Bombay",
    "description":
        "Bawang Bombay adalah sayuran yang kaya akan vitamin c, bermanfaat untuk menyehatkan kulit dan rambut.",
    "price": 25000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/JAC4nyoEAeJx09zHH8gE0JqhU1xMd6CHVPoH7rAt.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/LkyUms5p6We1HiWkfJCjeuyQ1U31yciVXzdH14Bv.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/63F9HLtPSuJ5xrGWgfLs2sJ5vM9jfeZqBPV35Ck3.jpg"
    ],
    "tags": ["bawang bombay", "jumbo"]
  },
  {
    "id": 3,
    "name": "Wortel",
    "description":
        "Wortel segar yang dipanen langsung dari kebun. Bermanfaat sebagai antioksidan serta meningkatkan penglihatan konsumen.",
    "price": 6000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/Z0sDo7uCZFru0bPor2NOBlpACgJyppaN5OEZN8Hy.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/VPVejJ07nBMkwNi2lL4KlEb8G3WP7R7dkKYGVrHZ.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/shFOhsN6S9AJLN70rcWVUkr4IqT06SZHxzt84fBV.jpg",
    ],
    "tags": ["wortel", "segar"]
  },
  {
    "id": 2,
    "name": "Tomat Merah",
    "description":
        "Sayur tomat merah segar. memiliki manfaat:\n- Mengurangi resiko kanker\n- Menurunkan dan mengontrol tekanan darah\n- Mengontrol kadar gula darah",
    "price": 10000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/bUB73MeP0Wms2v7e75nsRes0Ih3rAYrBAkLirKyy.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/jMp8rWpzpI8qxhnXHo9jmpSvnQJ12QOKxYixhzk9.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/zhEB5QA5oMGrMnsnDEpjS6K3BH978SqlEwMoJBjt.jpg",
    ],
    "tags": ["tomat", "segar", "merah"]
  },
  {
    "id": 1,
    "name": "Terong",
    "description":
        "Sayur terong ungu memiliki berat 250g, dipanen langsung dari kebun. memiliki manfaat:\n- Menurunkan kolesterol\n- Meningkatkan kesehatan tulang\n- Menurunkan berat badan",
    "price": 12000,
    "unit": "kg",
    "category": "Sayur",
    "product_images": [
      "https://yursayur.alwaysdata.net/storage/store/1/product/zUfU7QnLgXCwuCoctNoFXJbzEq3dSwycCGQDJWou.jpg",
      "https://yursayur.alwaysdata.net/storage/store/1/product/54fpnjWIpFf3G7mZgdVeGGCbNzDbNbbq2yX99dBL.webp",
      "https://yursayur.alwaysdata.net/storage/store/1/product/H7UuE7mWlQPeFs4q1LWh19oDau89Jke9q2NxgW1A.jpg",
    ],
    "tags": ["terong", "ungu"]
  }
];
