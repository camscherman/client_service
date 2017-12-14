
document.addEventListener('DOMContentLoaded', function(){

function filterBooks(str){
  var items = document.querySelectorAll('.book-item')
  items.forEach(function(i){
    if(i.innerHTML.toLowerCase().search(str.toLowerCase()) === -1){
      i.classList.add('hidden')
    } else {
      i.classList.remove('hidden')
    }
  })
}

var filter = document.querySelector('#filter')
filter.addEventListener('input', function(event){
  var item = event.currentTarget
  filterBooks(item.value)
})
})
