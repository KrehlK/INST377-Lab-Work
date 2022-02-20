let slidePosition = 0;
const slides = document.querySelectorAll('.carousel__item');
const totalSlides = slides.length;

document.querySelector('.carousel__button--next')
  .addEventListener('click', function () {
    moveToNextSlide();
  });
document.querySelector('.carousel__button--prev')
  .addEventListener("click", function () {
    moveToPrevSlide();
  });

function updateSlidePosition() {
  for (let slide of slides) {
    slide.classList.remove('carousel_item--visible');
    slide.classList.add('carousel_item--hidden');
  }

  slides[slidePosition].classList.add('carousel_item--visible');
}

function moveToNextSlide() {
  if (slidePosition == totalSlides) {
    slidePosition = 0;
  } else {
    slidePosition++;
  }
  updateSlidePosition();
}

function moveToPrevSlide() {
  if (slidePosition == 0) {
    slidePosition = 0;
  } else {
    slidePosition--;
  }
  updateSlidePosition();
}