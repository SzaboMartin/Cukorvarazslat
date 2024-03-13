const shareBtn = document.getElementById('shareBtn')

shareBtn.addEventListener('click', event => {

  if (navigator.share) {
    navigator.share({
      text: 'Please read this great article: ',
      url: 'file:///C:/xampp/htdocs/2_14_a/vizsgaremek/Cukorvarazslat/Cukraszda.html'
    }).then(() => {
      console.log('Thanks for sharing!');
    })
      .catch((err) => console.error(err));
  } else {
    alert("The current browser does not support the share function. Please, manually share the link")
  }
});
let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.querySelector('body');
let total = document.querySelector('.total');
let quantity = document.querySelector('.quantity');

openShopping.addEventListener('click', ()=>{
    body.classList.add('active');
})
