
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = function(dogs) {
  const dogLinks = [];
  Object.keys(dogs).forEach( (dogName) => {
    // console.log(dogName);
    const aTag = document.createElement("a");
    aTag.innerHTML = dogName;
    aTag.href = dogs[dogName];
    const liTag = document.createElement("li");
    liTag.classList.add("dog-link");
    // liTag.textContent = dogName;
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  })
  return dogLinks;
};

const attachDogLinks = function() {
  const dogLinks = dogLinkCreator(dogs);
  const ul = document.querySelector(".drop-down-dog-list");
  dogLinks.forEach( (link) => {
    // console.log(link);
    ul.appendChild(link);
  });
};

attachDogLinks();

const handleEnter = (e) => {
  
  const ul = document.querySelector(".drop-down-dog-list");

  ul.classList.remove("hidden")
  // if (ul.className === 'hidden'){
  //   ul.classList.remove('hidden'); 

  // }else {
  //    ul.classList.add('hidden');
  // }
}


const handleLeave = (e) => {
  
  const ul = document.querySelector(".drop-down-dog-list");

  ul.classList.add("hidden")

}

const hoverTitle = document.querySelector('.drop-down-dog-nav h3, .drop-down-dog-list')
const leaveTitle = document.querySelector('.drop-down-dog-nav');
hoverTitle.addEventListener('mouseenter', handleEnter);
leaveTitle.addEventListener('mouseleave', handleLeave);



