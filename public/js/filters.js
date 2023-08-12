/* Filters */
const filterBtn = document.getElementById("filter");

const showFilterData = (data) => {
  let mainArticles = document.getElementsByClassName("main-articles")[0];
      mainArticles.innerHTML = "";

      if(data.length > 0) {
        for(let i=0; i<data.length; i++) {

          let article = document.createElement("div");
          article.classList.add('article');
          let link = document.createElement("a");
          link.href = "/real-estate/" + data[i].id;
          let h2 = document.createElement("h2");
          h2.innerHTML = data[i].title;
          let articleWallpaper = document.createElement("div");
          articleWallpaper.classList.add('article-wallpaper');

          if(data[i].images != null) {
            let image = document.createElement("img");
            let imgDecode = JSON.parse(data[i].images);
            image.src = "storage/images/" + imgDecode[0];
            image.alt = "image";
            articleWallpaper.appendChild(image);
          }
          else {
            let noImage = document.createElement("img");
            noImage.src = "storage/images/no-image.jpg";
            noImage.alt = "no-image";
            articleWallpaper.appendChild(noImage);
          }
          
          link.appendChild(h2);
          link.appendChild(articleWallpaper);
          let categoryP = document.createElement("p");
          categoryP.innerHTML = "Category: " + data[i].category.category;
          let countryP = document.createElement("p");
          countryP.innerHTML = "Country: " + data[i].country;
          let cityP = document.createElement("p");
          cityP.innerHTML = "City: " + data[i].city;
          let priceP = document.createElement("p");
          priceP.innerHTML = "Price: " + data[i].price + '&euro;';

          article.appendChild(link);
          article.appendChild(categoryP);
          article.appendChild(countryP);
          article.appendChild(cityP);
          article.appendChild(priceP);

          mainArticles.appendChild(article);      
        }
        const paginate = document.getElementsByClassName("paginate")[0];
        paginate.style.display = "none";
      }
      else {
        let noDataDiv = document.createElement("div");
        noDataDiv.innerHTML = "No datas for this category!";
        noDataDiv.classList.add('noDatas');
        mainArticles.appendChild(noDataDiv);
      }
}

const applyFilter = (e) => {
    e.preventDefault();
    
    let categoriesFilter = document.getElementById("categories-filter").value;
    fetch("/real-estate/filter/" + categoriesFilter, {
        method: "GET"
    })
    .then((res) => res.json())
    .then((data) => {
      showFilterData(data);
      console.log(data);
    })
    .catch((err) => console.log(err));
}

if(filterBtn != null) {
  filterBtn.addEventListener("click", applyFilter);
}