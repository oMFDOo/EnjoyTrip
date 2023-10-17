<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        html, body {
            height: 100%;
        }

        .hide{
            display: none;
        }
    </style>
</head>
<body>
    <div class="container pt-3">
        <h2>관광지 검색</h2>
        <div class="row">
            <div class="col">
                <select id="area1List" class="form-select"><option value=''>시도</option></select>
            </div>
            <div class="col">
                <select id="area2List" class="form-select"><option value=''>구군</option></select>
            </div>
            <div class="col">
                <select id="cat1List" class="form-select"><option value=''>대분류</option></select>
            </div>
            <div class="col">
                <select id="cat2List" class="form-select"><option value=''>중분류</option></select>
            </div>
            <div class="col">
                <select id="cat3List" class="form-select"><option value=''>소분류</option></select>
            </div>
            <div class="col">
                <div class="d-grid gap-2">
                    <button id="btnSearch" type="button" class="btn btn-primary">검색</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row" id="itemList">
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-3"></div>
        </div>
    </div>
    <div class="container d-flex justify-content-center align-items-center h-100">
        <div id="spinner" class="spinner-border text-info hide" role="status"><!-- hide class 로 제어-->
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <script>
        // areaBsedList1 Service 를 이용한다.
        // BackEnd 를 이용하므로, areaCode 와 categoryCode 를 조건으로 모두 포함하는 페이지이다.

        // 공유 전역 변수
        let numOfRows = 12;
        let pageNo = 1;
        let areaCode = '';
        let sigunguCode = '';
        let cat1 = '';
        let cat2 = '';
        let cat3 = '';

        window.onload = async function(){
            showSpinner(true);

            await getArea1List();
            await getCat1List();

            document.querySelector("#btnSearch").onclick = function(){
                sigunguCode = document.querySelector("#area2List").value;
                cat3 = document.querySelector("#cat3List").value;
                getList();
            }

            showSpinner(false);
        }

        async function getList(){

            let url = `http://localhost:8080/WebBasic/trip/list`;
            let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&areaCode=${areaCode}&sigunguCode=${sigunguCode}&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let itemList = data.response.body.items.item;
            itemListHtml = ``;

            itemList.forEach( item => {
                console.log(item);
                itemListHtml +=
                `
                <div class="col-3">
                    <div class="card">
                        <img src="${item.firstimage}" class="card-img-top" alt="${item.title}">
                        <div class="card-body">
                            <h5 class="card-title">${item.title}</h5>
                            <p class="card-text">${item.addr1}</p>
                            <a href="#" class="btn btn-primary">Go</a>
                        </div>
                    </div>
                </div>
                `
            });

            document.querySelector("#itemList").innerHTML = itemListHtml;
        }

        async function getArea1List(){

            let url = `http://localhost:8080/WebBasic/trip/areaCode`;
	        let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>시도를 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += `<option value='${el.code}'>${el.name}</option>`
            })
            document.querySelector("#area1List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#area1List").onchange = function(e){
                areaCode = e.target.value;
                getArea2List();
            }
        }

        async function getArea2List(){

            let url = `http://localhost:8080/WebBasic/trip/areaCode`;
	        let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&areaCode=${areaCode}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>구군을 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += `<option value='${el.code}'>${el.name}</option>`
            })
            document.querySelector("#area2List").innerHTML = listHtml;
        }

        async function getCat1List(){

            let url = `http://localhost:8080/WebBasic/trip/categoryCode`;
	        let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>대분류 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += `<option value='${el.code}'>${el.name}</option>`
            })
            document.querySelector("#cat1List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#cat1List").onchange = function(e){
                cat1 = e.target.value;
                getCat2List();
            }
        }

        async function getCat2List(){
            let url = `http://localhost:8080/WebBasic/trip/categoryCode`;
	        let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&cat1=${cat1}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>중분류 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += `<option value='${el.code}'>${el.name}</option>`
            })
            document.querySelector("#cat2List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#cat2List").onchange = function(e){
                cat2 = e.target.value;
                getCat3List();
            }
        }

        async function getCat3List(){
            let url = `http://localhost:8080/WebBasic/trip/categoryCode`;
	        let urlParams = `?numOfRows=${numOfRows}&pageNo=${pageNo}&cat1=${cat1}&cat2=${cat2}`;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>소분류 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += `<option value='${el.code}'>${el.name}</option>`
            })
            document.querySelector("#cat3List").innerHTML = listHtml;
        }

        const spinner = document.querySelector("#spinner");
        function showSpinner(flag){
            if( flag ){
                spinner.classList.remove("hide");
            }else{
                spinner.classList.add("hide")
            }
        }
    </script>
</body>
</html>