/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n  constructor() {\n\n    const currentTime = new Date();\n\n  \n    // 2. Store the hours, minutes, and seconds.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n    // 3. Call printTime.\n    \n    this.clockElement = document.getElementById('clock');\n    this.printTime();\n    // 4. Schedule the tick at 1 second intervals.\n    setInterval(this._tick.bind(this), 1000);\n    // setInterval(this_tick,1000)\n  }\n  \n  printTime() {\n    // Format the time in HH:MM:SS\n    // Use console.log to print it.\n    // console.log(`${this.hours}:${this.minutes}:${this.seconds}`);\n    (0,_warmup__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(`${this.hours}:${this.minutes}:${this.seconds}`, this.clockElement);\n    \n  }\n  \n  _tick() {\n    \n    this.incrementSeconds();\n    \n    this.printTime();\n    // 1. Increment the time by one second.\n    // 2. Call printTime.\n    \n  }\n\n  incrementSeconds(){\n    this.seconds += 1 ;\n    if (this.seconds === 60){\n      this.seconds = 0;\n      this.incrementMinutes();\n    }\n  }\n  \n  incrementMinutes(){\n    this.minutes += 1 ;\n    if (this.minutes === 60){\n      this.minutes = 0;\n      this.incrementHours();\n    }\n  }\n  \n  incrementHours(){\n    this.hours += 1 ;\n    if (this.hours > 24){\n      this.hours = 1;\n    }\n  }\n  \n}\n\nconst clock = new Clock();\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/***/ (() => {

eval("\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nconst dogLinkCreator = function(dogs) {\n  const dogLinks = [];\n  Object.keys(dogs).forEach( (dogName) => {\n    // console.log(dogName);\n    const aTag = document.createElement(\"a\");\n    aTag.innerHTML = dogName;\n    aTag.href = dogs[dogName];\n    const liTag = document.createElement(\"li\");\n    liTag.classList.add(\"dog-link\");\n    // liTag.textContent = dogName;\n    liTag.appendChild(aTag);\n    dogLinks.push(liTag);\n  })\n  return dogLinks;\n};\n\nconst attachDogLinks = function() {\n  const dogLinks = dogLinkCreator(dogs);\n  const ul = document.querySelector(\".drop-down-dog-list\");\n  dogLinks.forEach( (link) => {\n    // console.log(link);\n    ul.appendChild(link);\n  });\n};\n\nattachDogLinks();\n\nconst handleEnter = (e) => {\n  \n  const ul = document.querySelector(\".drop-down-dog-list\");\n\n  ul.classList.remove(\"hidden\")\n  // if (ul.className === 'hidden'){\n  //   ul.classList.remove('hidden'); \n\n  // }else {\n  //    ul.classList.add('hidden');\n  // }\n}\n\n\nconst handleLeave = (e) => {\n  \n  const ul = document.querySelector(\".drop-down-dog-list\");\n\n  ul.classList.add(\"hidden\")\n\n}\n\nconst hoverTitle = document.querySelector('.drop-down-dog-nav h3, .drop-down-dog-list')\nconst leaveTitle = document.querySelector('.drop-down-dog-nav');\nhoverTitle.addEventListener('mouseenter', handleEnter);\nleaveTitle.addEventListener('mouseleave', handleLeave);\n\n\n\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/***/ (() => {

eval("const todos = [];\nconst ul = document.querySelector(\".todos\");\nconst addTodos = document.querySelector(\".add-todo-form\");\n\nconst addTodo = function() {\n\n  const doInput = document.querySelector(\"[name=add-todo]\").value;\n  const todo = {\"add-todo\": doInput, \"done\": false};\n  todos.push(todo);\n  doInput = \"\";\n};\n\nconst populateList = function() {\n  ul.innerHTML = todos.map((todo, idx) => {\n    return `<li>\n    <label>${todo['add-todo']}</label>\n    <input type='checkbox'></input>\n    </li>`;\n\n  });\n\n  // groceries.innerHTML = lsItems.map((item) => {\n  //   return `<li>${item.value}</li>`;\n  // }).join(\" \");\n}\n\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"htmlGenerator\": () => (/* binding */ htmlGenerator)\n/* harmony export */ });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  if (htmlElement.children.length != 0) {\n    // console.log(htmlElement.children);\n    Array.from(htmlElement.children).forEach( (ele) => {\n      htmlElement.removeChild(ele);\n    });\n  }\n\n  const ptag= document.createElement(\"p\");\n  ptag.textContent = string;\n  htmlElement.appendChild(ptag);\n};\n\nhtmlGenerator('hello.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;