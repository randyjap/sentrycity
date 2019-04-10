window.custom.search = (event) => {
  event.preventDefault();

  let params = $('#search-form').serialize();

  $.ajax({
    beforeSend: xhr => { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/s`,
    method: "POST",
    data: params,
  })
  .done((data) => {
  })
  .fail(() => {
  })
  .always(() => {
  });
};