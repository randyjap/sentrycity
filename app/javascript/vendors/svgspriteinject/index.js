// ------------------------------------------------------- //
//   Inject SVG Sprite -
//   see more here
//   https://css-tricks.com/ajaxing-svg-sprite/
// ------------------------------------------------------ //
function injectSvgSprite(path) {

    var ajax = new XMLHttpRequest();
    ajax.open("GET", path, true);
    ajax.send();
    ajax.onload = function(e) {
    var div = document.createElement("div");
    div.className = 'd-none';
    div.innerHTML = ajax.responseText;
    document.body.insertBefore(div, document.body.childNodes[0]);
    }
}
// to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
// use your own URL in production, please :)
// https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
//- injectSvgSprite('icons/orion-svg-sprite.svg');
injectSvgSprite('https://demo.bootstrapious.com/directory/1-1/icons/orion-svg-sprite.svg');