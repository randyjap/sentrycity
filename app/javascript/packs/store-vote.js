import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.sThumbsUp = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/store_vote`,
    method: "POST",
    data: { store_vote: { vote: 1 } },
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

window.custom.sThumbsDown = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/store_vote`,
    method: "POST",
    data: { store_vote: { vote: -1 } },
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