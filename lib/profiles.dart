final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      "assets/1.jpg",
    ],
    name: "Water Bottle" ,
    bio: "Water Bottles are dry waste",
  ),
  new Profile(
    photos: [
      "assets/11.jpg",
    ],
    name: "Rotten Food" ,
    bio: "Rotten Food is wet waste",
  ),
  new Profile(
    photos: [
      "assets/2.jpg",
    ],
    name: "Old Clothes" ,
    bio: "Old Clothes are dry waste",
  ),
  new Profile(
    photos: [
      "assets/12.jpg",
    ],
    name: "Egg Shells" ,
    bio: "Egg shells are wet waste",
  ),
  new Profile(
    photos: [
      "assets/3.jpg",
    ],
    name: "Used Papers" ,
    bio: "Used Papers are dry waste",
  ),
  new Profile(
    photos: [
      "assets/13.jpg",
    ],
    name: "Vegie Remains" ,
    bio: "Vegie Remains are wet waste",
  ),
];

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}
