var menuBtn = document.querySelector('.menu-btn');
var nav = document.querySelector('nav');
var lineOne = document.querySelector('nav .menu-btn .line--1');
var img = document.querySelector('nav .menu-btn img');
var lineThree = document.querySelector('nav .menu-btn .line--3');
var link = document.querySelector('nav .nav-links');
menuBtn.addEventListener('click', () => {
	nav.classList.toggle('nav-open');
	lineOne.classList.toggle('line-cross');
	img.classList.toggle('fade-out');
	lineThree.classList.toggle('line-cross');
	link.classList.toggle('fade-in');
})