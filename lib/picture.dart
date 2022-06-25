import 'package:flutter/material.dart';

class Picture {
  String? id;
  String? createdAt;
  String? updatedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  int? downloads;
  int? likes;
  bool? likedByUser;
  String? description;
  Exif? exif;
  Location? location;
  List<CurrentUserCollections>? currentUserCollections;
  Urls? urls;
  Links? links;
  User? user;
  Image? image;
  Picture({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.downloads,
    this.likes,
    this.likedByUser,
    this.description,
    this.exif,
    this.location,
    this.currentUserCollections,
    this.urls,
    this.links,
    this.user,
  });

  Picture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    downloads = json['downloads'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    exif = json['exif'] != null ? Exif.fromJson(json['exif']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['current_user_collections'] != null) {
      currentUserCollections = <CurrentUserCollections>[];
      json['current_user_collections'].forEach((v) {
        currentUserCollections!.add(CurrentUserCollections.fromJson(v));
      });
    }
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    image = Image.network(urls!.regular!, fit: BoxFit.fill);
  }
}

class Exif {
  String? make;
  String? model;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;

  Exif(
      {this.make,
      this.model,
      this.exposureTime,
      this.aperture,
      this.focalLength,
      this.iso});

  Exif.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }
}

class Location {
  String? name;
  String? city;
  String? country;
  Position? position;

  Location({this.name, this.city, this.country, this.position});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    country = json['country'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
  }
}

class Position {
  double? latitude;
  double? longitude;

  Position({this.latitude, this.longitude});

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class CurrentUserCollections {
  int? id;
  String? title;
  String? publishedAt;
  String? lastCollectedAt;
  String? updatedAt;
  Null? coverPhoto;
  Null? user;

  CurrentUserCollections(
      {this.id,
      this.title,
      this.publishedAt,
      this.lastCollectedAt,
      this.updatedAt,
      this.coverPhoto,
      this.user});

  CurrentUserCollections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publishedAt = json['published_at'];
    lastCollectedAt = json['last_collected_at'];
    updatedAt = json['updated_at'];
    coverPhoto = json['cover_photo'];
    user = json['user'];
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? portfolioUrl;
  String? bio;
  String? location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  String? instagramUsername;
  String? twitterUsername;
  UserLinks? links;

  User(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.totalLikes,
      this.totalPhotos,
      this.totalCollections,
      this.instagramUsername,
      this.twitterUsername,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    instagramUsername = json['instagram_username'];
    twitterUsername = json['twitter_username'];
    links = json['links'] != null ? UserLinks.fromJson(json['links']) : null;
  }
}

class UserLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;

  UserLinks({this.self, this.html, this.photos, this.likes, this.portfolio});

  UserLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
  }
}
