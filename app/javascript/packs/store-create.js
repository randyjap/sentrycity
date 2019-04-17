import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.createStore = (event) => {
  event.preventDefault();
  if (redirectIfLoggedOut()) return;

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

window.custom.updateStore = () => {
  if (redirectIfLoggedOut()) return;

  let params = $('#create-a-store-form').serialize();

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: "/create-a-store",
    method: "PUT",
    data: params
  })
  .done(() => {
  })
  .fail(() => {
  })
  .always(() => {
  });
}

window.custom.finishStore = () => {
  if (redirectIfLoggedOut()) return;

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: "/create-a-store",
    method: "PUT",
    data: { store_params: { finished: true } }
  })
  .done(() => {
  })
  .fail(() => {
  })
  .always(() => {
  });
}