import $ from "jquery"

window.$ = $;

let redirectIfLoggedOut = () => {
  if ($('#login-status').attr('data-logged-in') !== "true") {
    window.location.href = "/users/sign_in";
    return
  }
}

export { redirectIfLoggedOut }