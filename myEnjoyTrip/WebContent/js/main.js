// areaBsedList1 Service 를 이용한다.
// BackEnd 를 이용하므로, areaCode 와 categoryCode 를 조건으로 모두 포함하는 페이지이다.

// 공유 전역 변수
let numOfRows = 12;
let pageNo = 1;
let areaCode = "";
let sigunguCode = "";
let cat1 = "";
let cat2 = "";
let cat3 = "";
let BASE_URL = `http://192.168.203.109:8080/WebBasic/trip/`;
window.onload = async function () {
	  showSpinner(true);

	  await getArea1List();
	  await getCat1List();

	  document.querySelector("#btnSearch").onclick = function () {
	    sigunguCode = document.querySelector("#area2List").value;
	    cat3 = document.querySelector("#cat3List").value;
	    getList();
	  };

	  showSpinner(false);
	};

	async function getList() {
	  let url = BASE_URL + `list`;
	  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&areaCode=${areaCode}&sigunguCode=${sigunguCode}&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}`;

	  let response = await fetch(url + urlParams);
	  let data = await response.json();
	  // console.log(data);

	  let itemList = data.response.body.items.item;
	  itemListHtml = ``;
	  // mapx
	  // mapy
	  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	    mapOption = {
	      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	      level: 8, // 지도의 확대 레벨
	    };

	  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	  let sumMapx = 0.0;
	  let sumMapy = 0.0;
	  let cnt = 0;
	  itemList.forEach((item) => {
	    var markerPosition = new kakao.maps.LatLng(item.mapy, item.mapx);

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	      position: markerPosition,
	    });
	    sumMapx += parseFloat(item.mapx);
	    sumMapy += parseFloat(item.mapy);
	    cnt += 1;

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    itemListHtml += `
	              <div class="col-lg-6 col-md-6 mb-5">
	                <div class="blog-item">
	                  <div class="blog-item-content bg-white p-5">
	                    <img src="${item.firstimage}" class="card-img-top" alt="${item.title}">

	                    <div class="card-body">
	                      <h5 class="card-title">${item.title}</h5>
	                      <p class="card-text">${item.addr1}</p>
	                      <button href="#" class="btn btn-primary" onclick="showDetail(${itemList.indexOf(
	                        item
	                      )})">Go</button>
	                    </div>
	                  </div>
	                </div>
	              </div>
	                `;
	  });


  document.querySelector("#itemList").innerHTML = itemListHtml;
  var moveLatLon = new kakao.maps.LatLng(sumMapy / cnt, sumMapx / cnt);

  // 지도 중심을 이동 시킵니다
  map.setCenter(moveLatLon);
  // 지도 중심을 이동 시킵니다
  // map.setCenter(moveLatLon);
}

async function showDetail(index) {
  let dt = document.querySelector("#detail");
  dt.style.visibility = "visible";

  let url = BASE_URL + `list`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&areaCode=${areaCode}&sigunguCode=${sigunguCode}&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}`;
  let response = await fetch(url + urlParams);
  let data = await response.json();
  let itemList = data.response.body.items.item;

  let selectedItem = itemList[index];
  console.log(selectedItem.title);
  console.log(selectedItem.addr1);
  dt.innerHTML = `
  <div>
    <div>
      <h2 class="ml-3 mt-3">${selectedItem.title}</h2>
      <p class="ml-3 mt-3">${selectedItem.addr1}</p>
      <button class="detailClose" onclick=closeDetail()>X</button>
    </div>
  </div>
  `;
}

async function closeDetail() {
  let dt = document.querySelector("#detail");
  dt.style.visibility = "hidden";
}

async function getArea1List() {
  let url = BASE_URL + `areaCode`;
  // let url = `http://localhost:8080/htmlcss/trip/areaCode`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}`;

  let response = await fetch(url + urlParams);
  let data = await response.json();
  console.log(data);

  let codeList = data.response.body.items.item;
  console.log(codeList);

  let listHtml = `<option value=''>시도를 선택하세요</option>`;
  codeList.forEach((el) => {
    listHtml += `<option value='${el.code}'>${el.name}</option>`;
  });
  document.querySelector("#area1List").innerHTML = listHtml;

  // change event handler
  document.querySelector("#area1List").onchange = function (e) {
    areaCode = e.target.value;
    getArea2List();
  };
  // console.log("???")
}

async function getArea2List() {
  let url = BASE_URL + `areaCode`;
  // let url = `http://localhost:8080/htmlcss/trip/areaCode`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&areaCode=${areaCode}`;

  let response = await fetch(url + urlParams);
  let data = await response.json();
  console.log(data);

  let codeList = data.response.body.items.item;
  console.log(codeList);

  let listHtml = `<option value=''>구군을 선택하세요</option>`;
  codeList.forEach((el) => {
    listHtml += `<option value='${el.code}'>${el.name}</option>`;
  });
  document.querySelector("#area2List").innerHTML = listHtml;
}

async function getCat1List() {
  let url = BASE_URL + `categoryCode`;
  // let url = `http://localhost:8080/htmlcss/trip/categoryCode`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}`;

  let response = await fetch(url + urlParams);
  let data = await response.json();
  console.log(data);

  let codeList = data.response.body.items.item;
  console.log(codeList);

  let listHtml = `<option value=''>대분류 선택하세요</option>`;
  codeList.forEach((el) => {
    listHtml += `<option value='${el.code}'>${el.name}</option>`;
  });
  document.querySelector("#cat1List").innerHTML = listHtml;

  // change event handler
  document.querySelector("#cat1List").onchange = function (e) {
    cat1 = e.target.value;
    getCat2List();
  };
}

async function getCat2List() {
  let url = BASE_URL + `categoryCode`;
  // let url = `http://localhost:8080/htmlcss/trip/categoryCode`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&cat1=${cat1}`;

  let response = await fetch(url + urlParams);
  let data = await response.json();
  console.log(data);

  let codeList = data.response.body.items.item;
  console.log(codeList);

  let listHtml = `<option value=''>중분류 선택하세요</option>`;
  codeList.forEach((el) => {
    listHtml += `<option value='${el.code}'>${el.name}</option>`;
  });
  document.querySelector("#cat2List").innerHTML = listHtml;

  // change event handler
  document.querySelector("#cat2List").onchange = function (e) {
    cat2 = e.target.value;
    getCat3List();
  };
}

async function getCat3List() {
  let url = BASE_URL + `categoryCode`;
  // let url = `http://localhost:8080/htmlcss/trip/categoryCode`;
  let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&cat1=${cat1}&cat2=${cat2}`;

  let response = await fetch(url + urlParams);
  let data = await response.json();
  console.log(data);

  let codeList = data.response.body.items.item;
  console.log(codeList);

  let listHtml = `<option value=''>소분류 선택하세요</option>`;
  codeList.forEach((el) => {
    listHtml += `<option value='${el.code}'>${el.name}</option>`;
  });
  document.querySelector("#cat3List").innerHTML = listHtml;
}

function showSpinner(flag) {
  const spinner = document.querySelector("#spinner");
  if (flag) {
    spinner.classList.remove("hide");
  } else {
    spinner.style.display = "none";
  }
}
