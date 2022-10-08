abstract class Environment {
  static headers(token) {
    return {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
  }

  static const URL = "https://192.168.1.6:7062/api/";
}
