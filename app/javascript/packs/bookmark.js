import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.bookmark = (event, storeId) => {
  event.preventDefault();
  if (redirectIfLoggedOut()) return;

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/bookmark`,
    method: "POST",
    data: { },
  })
  .done((data) => {
  })
  .fail(() => {
  })
  .always(() => {
  });
};
