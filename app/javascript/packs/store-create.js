import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.createStore = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores`,
    method: "POST",
  })
  .done((data) => {
    window.location.href = data.redirect;
  })
  .fail(() => {
  })
  .always(() => {
  });
};