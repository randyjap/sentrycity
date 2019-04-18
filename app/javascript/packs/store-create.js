import { redirectIfLoggedOut } from '../vendors/shared/index';

window.custom.updateStore = (event, finished) => {
  if (redirectIfLoggedOut()) return;

  let params = $('#create-a-store-form').serialize();
  if (finished === 'true') params = params + '&finished=true';

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