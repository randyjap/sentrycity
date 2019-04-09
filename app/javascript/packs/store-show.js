import $ from "jquery"

window.$ = $;
window.custom = {};

let redirectIfLoggedOut = () => {
  if ($('#login-status').attr('data-logged-in') !== "true") {
    window.location.href = "/users/sign_in";
    return
  }
}

window.custom.thumbsUp = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/store_vote`,
    method: "POST",
    data: { vote: 1 },
  })
  .done((data) => {
    thumbsUp.removeClass('text-white');
    points.text(data['points']);
  })
  .fail(() => {
  })
  .always(() => {
  });
};

window.custom.thumbsDown = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/store_vote`,
    method: "POST",
    data: { vote: -1},
  })
  .done((data) => {
    thumbsUp.removeClass('text-white');
    points.text(data['points']);
  })
  .fail(() => {
  })
  .always(() => {
  });
};