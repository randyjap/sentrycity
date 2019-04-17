import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.cThumbsUp = (event, commentId) => {
  event.preventDefault();
  if (redirectIfLoggedOut()) return;

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/comments/${commentId}/comment_vote`,
    method: "POST",
    data: { comment_vote: { vote: 1 } },
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

window.custom.cThumbsDown = (event, commentId) => {
  event.preventDefault();
  redirectIfLoggedOut();

  let thumbsUp = $('#thumbs-up');
  let points = $('#points');
  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/comments/${commentId}/comment_vote`,
    method: "POST",
    data: { comment_vote: { vote: -1 } },
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