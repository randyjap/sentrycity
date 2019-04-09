import { redirectIfLoggedOut, convertToJson } from '../vendors/shared/index';

window.custom.comment = (event, storeId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let payload = convertToJson($('#comment-form'));

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/stores/${storeId}/comments`,
    method: "POST",
    data: { comment: payload },
  })
  .done((data) => {
    $('#comment-form')[0].reset();
  })
  .fail(() => {
  })
  .always(() => {
  });
};

window.custom.deleteComment = (event, commentId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/comments/${commentId}`,
    method: "DELETE",
    data: { },
  })
  .done((data) => {
  })
  .fail(() => {
  })
  .always(() => {
  });
};
