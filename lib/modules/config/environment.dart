abstract class Environment {
  static headers(token) {
    return {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
  }

  static const URL = "https://greeenwaveapi.azurewebsites.net/api/";
}
