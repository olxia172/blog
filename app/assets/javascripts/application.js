// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

//= require jquery
//= require bootstrap-sprockets

// alert("Heloooooo!")

// MODYFIKACJE FORMULARZA WYSZUKIWANIA
// window.addEventListener("load", function() {
//   document.getElementById("q").value = "form js";
//
//   document.getElementById("q").addEventListener('keypress', function() {
//     console.log(this.value);
//   });
//
//   document.getElementById("q").addEventListener('mouseover', function () {
//     console.log('myszka nad formularzem')
//   });
// });
//
// PROSTY KALKULATOR
// window.addEventListener('load', function () {
//   document.getElementById('btncalc').addEventListener('click', function () {
//     var num1 = parseInt(document.getElementById('num1').value);
//     var num2 = parseInt(document.getElementById('num2').value);
//     var result = num1 + num2;
//     document.getElementById('result').innerHTML = result;
//   });
// });

// AJAX
// window.addEventListener('load', function () {
//   var request = new XMLHttpRequest();
//   request.open("GET", "http://localhost:3000/test.txt");
//   request.responseType = 'json';
//   request.addEventListener('load', function () {
//     document.getElementById("q").value = this.response.message;
//     var newElement = document.createElement('h1');
//     newElement.innerText = this.response.var;
//     document.body.appendChild(newElement);
//   });
//   request.send();
// })

function showComments() {
    var x = document.getElementById("all-comments");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function numberOfArticles () {
  var sumOfArticles = document.getElementsByClassName('article').length;
  var articlesSummary = document.getElementById('articles-summary');
  articlesSummary.innerText = "Current number of articles is " + sumOfArticles;
}

// document.getElementsByClassName = $()

$(document).ready(function(){
  var sumOfArticles = $('.article').size();
  $('#articles-summary').hide().text("Current number of articles is " + sumOfArticles).fadeIn();
})

window.addEventListener("load", function () {
  //setTimeout(numberOfArticles, 1000);
})

window.addEventListener("load", function() {
  var elements = document.querySelectorAll('.summary');
  for(var i = 0; i < elements.length; i++) {
    elements[i].addEventListener("click", function(e) {
      e.preventDefault();
      var request = new XMLHttpRequest();
      request.open("GET", this.href + ".json");
      request.responseType = 'json';
      request.addEventListener('load', function () {
        var summary = document.getElementById("summary-" + this.response.id);
        summary.innerText = "Comments: " + this.response.comments + ". Likes: " + this.response.likes;
      });
      request.send();
    })
  }
});

var request = new XMLHttpRequest();
request.open("GET", "http://localhost:3000/articles.json");
request.responseType = 'json';
request.addEventListener('load', function () {
  console.log(this.response.length);
})
