const trailer = () => {

  const x = document.querySelector('.first-result > img');
  console.log(x);

  const button = document.getElementById('trailer-button');


  x.addEventListener('mouseover', (event) => {

    x.style.backgroundColor="rgba(0, 0, 0, 0.3)";
    button.style.opacity="50%";

    button.addEventListener('mouseover', (event) => {
      button.style.opacity="100%";
    });

    button.addEventListener('mouseout', (event) => {
      button.style.opacity="50%";
    });

  });

  x.addEventListener('mouseout', (event) => {

    x.style.background="none";
    button.style.opacity="15%";
  });



  button.addEventListener('click', (event) => {
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
