class Apiconfig {
  static const baseUrl = "http://172.16.8.146:3033";
  static const loginApi = "/user/login";
  static const signupApi = "/user/signup";
  static const otp = "/user/otp";
  static const loginCheck = "/user/loginCheck"; 
}

class ApiQueryParameter {
  static const queryParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}
