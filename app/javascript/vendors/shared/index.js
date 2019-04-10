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
    if (data.name.slice(data.name.length - 2) === '[]') {
      if (json[data.name] === undefined) { json[data.name] = [] }
      json[data.name].push(data.value)
    } else {
      json[data.name] = data.value || '';
    }
  });

  return json;
}

export { redirectIfLoggedOut, convertToJson }