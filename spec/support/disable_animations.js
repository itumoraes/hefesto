/* This script sets lower values for CSS animations/transitions delays.
 * It is used to speed up integration specs. It is loaded as an extension on
 * PhantomJS, so it will be injected on every requested page.
 */
document.addEventListener("DOMContentLoaded", function(event) {
    var css = '-webkit-animation-delay: 0 !important;' +
              '-webkit-animation-duration: 0.0001s !important;' +
              '-webkit-transition-delay: 0 !important;' +
              '-webkit-transition-duration: 0.0001s !important;';

    var style = document.createElement('style');
    style.type = 'text/css';
    style.innerHTML = '* {' + css + '}';
    document.head.appendChild(style);
});
