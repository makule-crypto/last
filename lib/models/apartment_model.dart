class ApartmentModel {
  String name;
  double price;
  String sizeDesc;
  double review;
  double reviewCount;
  String desc;
  int sizeLivingRoom;
  int sizeBedRoom;
  int sizeBathRoom;
  int sizekitchen;
  List<String> features;
  List<String> personImages;
  List<String> images;
  int units;

  ApartmentModel({
    required this.name,
    required this.price,
    required this.sizeDesc,
    required this.review,
    required this.reviewCount,
    required this.desc,
    required this.sizeLivingRoom,
    required this.sizeBedRoom,
    required this.sizeBathRoom,
    required this.sizekitchen,
    required this.features,
    required this.personImages,
    required this.images,
    required this.units,
  });

  static List<ApartmentModel> list = [
    ApartmentModel(
      name: "Lovren Apartment",
      price: 15,
      sizeDesc: "Double family house",
      review: 5,
      reviewCount: 547,
      desc:
          "located at gate A in a neighbourhood full of shops and other businesses... Once you press pay and book, you will be automatically directed to MPESA where you will be prompt to enter your pin soo as to initiate the Transaction",
      sizeLivingRoom: 80,
      sizeBedRoom: 20,
      sizeBathRoom: 12,
      sizekitchen: 15,
      features: ["Air Conditioner", "Wi-Fi", "TV-cable"],
      personImages: ["1", "2"],
      images: ["1.1", "1.2", "1.3", "1.4"],
      units: 10,
    ),
    ApartmentModel(
      name: "Cozy Flat",
      price: 20,
      sizeDesc: "Double family house",
      review: 4,
      reviewCount: 223,
      desc:
          "located at gate B in a safe quiet neighbourhood... Once you press pay and book, you will be automatically directed to MPESA where you will be prompt to enter your pin soo as to initiate the Transaction",
      sizeLivingRoom: 80,
      sizeBedRoom: 20,
      sizeBathRoom: 12,
      sizekitchen: 15,
      features: ["Air Conditioner", "Wi-Fi", "MiniBar", "TV-cable"],
      personImages: ["1", "2"],
      images: ["2.1", "2.2", "2.3", "2.4"],
      units: 15,
    ),
    ApartmentModel(
      name: "AVE Apartment",
      price: 14,
      sizeDesc: "Double family house",
      review: 4.5,
      reviewCount: 1378,
      desc:
          "located at gate C there is a lot of apartments in this area, so if you like socializing this is a place for you... Once you press pay and book, you will be automatically directed to MPESA where you will be prompt to enter your pin soo as to initiate the Transaction",
      sizeLivingRoom: 80,
      sizeBedRoom: 20,
      sizeBathRoom: 12,
      sizekitchen: 15,
      features: ["Air Conditioner", "Wi-Fi", "MiniBar", "TV-cable"],
      personImages: ["1", "2"],
      images: ["3.1", "3.2", "3.3", "3.4"],
      units: 8,
    ),
    ApartmentModel(
      name: "Rising cock Apartment",
      price: 25,
      sizeDesc: "Double family house",
      review: 4.5,
      reviewCount: 1378,
      desc:
          "located at gate E a very quite and peace full area suitable for privacy required activities... Once you press pay and book, you will be automatically directed to MPESA where you will be prompt to enter your pin soo as to initiate the Transaction",
      sizeLivingRoom: 80,
      sizeBedRoom: 20,
      sizeBathRoom: 12,
      sizekitchen: 15,
      features: ["Air Conditioner", "Wi-Fi", "MiniBar", "TV-cable"],
      personImages: ["1", "2"],
      images: ["4.1", "4.2", "4.3", "4.4"],
      units: 5,
    ),
    ApartmentModel(
      name: "Moonlight Apartment",
      price: 10,
      sizeDesc: "Double family house",
      review: 4.5,
      reviewCount: 1378,
      desc:
          "located at gate D this area is full of chilles so if you are a single guy this is a place for you... Once you press pay and book, you will be automatically directed to MPESA where you will be prompt to enter your pin soo as to initiate the Transaction",
      sizeLivingRoom: 80,
      sizeBedRoom: 20,
      sizeBathRoom: 12,
      sizekitchen: 15,
      features: ["Air Conditioner", "Wi-Fi", "MiniBar", "TV-cable"],
      personImages: ["1", "2"],
      images: ["5.1", "5.2", "5.3", "5.4"],
      units: 10,
    )
  ];
}
