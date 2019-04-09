import $ from "jquery"

window.$ = $;

let redirectIfLoggedOut = () => {
  if ($('#login-status').attr('data-logged-in') !== "true") {
    window.location.href = "/users/sign_in";
    return
  }
}

let convertToJson = form => {
  let array = form.serializeArray();
  let json = {};

  array.forEach((data) => {
    json[data.name] = data.value || '';
  });

  return json;
}

export { redirectIfLoggedOut, convertToJson }