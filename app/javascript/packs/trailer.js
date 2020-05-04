const trailer = () => {

  const button = document.getElementById('trailer-button');

  button.addEventListener('click', (event) => {
    document.getElementById('youtube-modal').style.display="block";
  });

  const x_button = document.getElementById('x-button');
  x_button.addEventListener('click', (event) => {

    stopVideo(document.getElementById('youtube-modal'))

    document.getElementById('youtube-modal').style.display="none";
  });

  var stopVideo = function ( element ) {
      var iframe = element.querySelector('iframe');
      if ( iframe !== null ) {
          var iframeSrc = iframe.src;
          iframe.src = iframeSrc;
      }
  };


};

export { trailer };


// <iframe src="https://www.youtube.com/embed/koPg_DZUfOc"></iframe>

// stopVideo(document.getElementById('youtube-modal'));
