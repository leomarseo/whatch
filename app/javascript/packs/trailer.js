const trailer = () => {

  const movie_poster = document.querySelector('.normal-result > img');
  console.log(movie_poster);

  const play_button = document.getElementById('trailer-button');


  movie_poster.addEventListener('mouseover', (event) => {

    movie_poster.style.backgroundColor="rgba(0, 0, 0, 0.3)";
    play_button.style.opacity="50%";

    play_button.addEventListener('mouseover', (event) => {
      movie_poster.style.backgroundColor="rgba(0, 0, 0, 0.3)";
      play_button.style.opacity="100%";
    });

    play_button.addEventListener('mouseout', (event) => {
      play_button.style.opacity="50%";

    });

  });

  movie_poster.addEventListener('mouseout', (event) => {

    movie_poster.style.background="none";
    play_button.style.opacity="15%";
  });



  play_button.addEventListener('click', (event) => {
    document.getElementById('transparent-background').style.display="block";
  })


  const transparent_back = document.getElementById('transparent-background');
    transparent_back.addEventListener('click', (event) => {

      stopVideo(transparent_back)

      transparent_back.style.display="none";
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



  // const x_button = document.getElementById('x-button');
  // x_button.addEventListener('click', (event) => {

  //   stopVideo(document.getElementById('youtube-modal'))

  //   document.getElementById('youtube-modal').style.display="none";
  // });

  // var stopVideo = function ( element ) {
  //     var iframe = element.querySelector('iframe');
  //     if ( iframe !== null ) {
  //         var iframeSrc = iframe.src;
  //         iframe.src = iframeSrc;
  //     }
  // };
