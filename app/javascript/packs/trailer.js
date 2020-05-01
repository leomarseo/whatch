const trailer = () => {
  console.log('accipicchia');
  const button = document.getElementById('trailer-button');
  console.log(button)

  button.addEventListener('click', (event) => {

    console.log('dkfjngdkjn')
    document.querySelector('.youtube-modal').style.display="block";
  });

  const iframe_container = document.querySelector('.iframe-container')
  iframe_container.addEventListener('click', (event) => {

    document.querySelector('.youtube-modal').style.display="none";
  });

};

export { trailer };


// <iframe src="https://www.youtube.com/embed/koPg_DZUfOc"></iframe>
