import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String firstName;
  final String email;
  final String lastName;
  final String profilePicture;
  final String phoneNumber;
  final String userName;
  UserModel(
      {required this.id,
      required this.firstName,
      required this.email,
      required this.lastName,
      required this.profilePicture,
      required this.phoneNumber,
      required this.userName});

  String get fullName => '$firstName $lastName';
  String get formattedphoneNumber => TFormatter.formatPhoneNumber(phoneNumber);
  static List<String> nameParts(fullname) => fullname.split(' ');
  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      email: '',
      lastName: '',
      profilePicture: '',
      phoneNumber: '',
      userName: '');
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'lasrtName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'userName': userName,
      'id': id,
    };
  }

  factory UserModel.fromsnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? "",
        email: data['email'] ?? "",
        lastName: data['lasrtName'] ?? "",
        profilePicture: data['profilePicture'] ?? "",
        phoneNumber: data['phoneNumber'] ?? "",
        userName: data['userName'] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }
}
