
const achievements = () => {

  const button1 = document.getElementById('button-1');
  const button2 = document.getElementById('button-2');
  const button3 = document.getElementById('button-3');
  const button4 = document.getElementById('button-4');
  const button5 = document.getElementById('button-5');
  const button6 = document.getElementById('button-6');
  const button7 = document.getElementById('button-7');

  button1.addEventListener('click', (event) => {
    button1.classList.add('border-selection');
    button2.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    button7.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button2.addEventListener('click', (event) => {
    button2.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    button7.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button3.addEventListener('click', (event) => {
    button3.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button2.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    button7.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button4.addEventListener('click', (event) => {
    button4.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button2.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    button7.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button5.addEventListener('click', (event) => {
    button5.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button2.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    button7.classList.remove('border-selection');

    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button6.addEventListener('click', (event) => {
    button6.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button2.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button7.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button7.addEventListener('click', (event) => {
    button7.classList.add('border-selection');
    button1.classList.remove('border-selection');
    button2.classList.remove('border-selection');
    button3.classList.remove('border-selection');
    button4.classList.remove('border-selection');
    button5.classList.remove('border-selection');
    button6.classList.remove('border-selection');
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });



  const hideAchievements = (id) => {
    let children = document.getElementById('all-achievements').children;
    children[0].style.display="none";
    children[1].style.display="none";
    children[2].style.display="none";
    children[3].style.display="none";
    children[4].style.display="none";
    children[5].style.display="none";
    children[6].style.display="none";
    children[id].style.display="block";

  };
};

export { achievements };
