
const achievements = () => {

  console.log("ciao");
  const button1 = document.getElementById('button-1');
  const button2 = document.getElementById('button-2');
  const button3 = document.getElementById('button-3');
  const button4 = document.getElementById('button-4');
  const button5 = document.getElementById('button-5');
  const button6 = document.getElementById('button-6');
  const button7 = document.getElementById('button-7');

  button1.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button2.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button3.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button4.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button5.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button6.addEventListener('click', (event) => {
    let id = Number.parseInt(event.target.dataset.id, 10) - 1;
    hideAchievements(id);
  });

  button7.addEventListener('click', (event) => {
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
