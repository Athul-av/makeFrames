class Apiconfig {
  static const baseUrl = "https://makeframes.onrender.com";
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
  static const allusers = "/user/allUsers";
  static const singleuser = "/user/fetchUserData";
  static const userspost = "/user/fetchPostsOfUser";
  static const bookshow = "/user/bookProgram";
  static const userbookedshows = "/user/fetchBookedPg";
  static const artistgotbookings = "/user/checkBookingHost";
  static const acceptshow = "/user/acceptProgram";
  static const denyshow = "/user/rejectProgram";
  static const givehype = "/user/hypeHim";
  static const hypestatus = "/user/takeHypeStatus";
  static const sendmssg = "/user/message";
  static const getmssg = "/user/getchat";
}

class ApiQueryParameter {
  static const queryParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}
