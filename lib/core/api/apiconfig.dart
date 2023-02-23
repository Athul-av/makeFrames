class Apiconfig {
  static const baseUrl = "http://10.4.3.192:3033";
  static const loginApi = "/user/login";
  static const signupApi = "/user/signup";
  static const otp = "/user/otp";
  static const loginCheck = "/user/loginCheck";
  static const checkartist = "/user/checkArtist"; 
  static const beartist = "/user/registerArtist";
  static const profilePicAdd = "/user/profilePic";
  static const bringDP = "/user/bringDp";
  static const addpost = "/user/addPost";
  static const allpost = "/user/pickPosts";
  static const createshow = "/user/submitProgram";
  static const artistcreatedshow = "/user/viewPrograms"; 
  static const allstageshow = "/user/bringAllpost";
 }

class ApiQueryParameter {
  static const queryParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json',

  };
}
