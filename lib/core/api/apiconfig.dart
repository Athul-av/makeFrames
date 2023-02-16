class Apiconfig {
  static const baseUrl = "http://10.4.4.123:3033";
  static const loginApi = "/user/login";
  static const signupApi = "/user/signup";
  static const otp = "/user/otp";
  static const loginCheck = "/user/loginCheck";
  static const checkartist = "/user/checkArtist"; 
  static const beartist = "/user/registerArtist";
 }

class ApiQueryParameter {
  static const queryParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}
