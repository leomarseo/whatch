const serviceRedirect = () => {
  let serviceCards = document.getElementById('services-container').children;
  for (let i = 0; i < serviceCards.length; i++) {
    let card = serviceCards[i];
    let url = card.dataset.link
    card.addEventListener('click', event => {
      window.open(url, '_blank');
    })
  }
};

export { serviceRedirect };
