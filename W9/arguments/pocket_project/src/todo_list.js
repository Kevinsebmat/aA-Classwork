const todos = [];
const ul = document.querySelector(".todos");
const addTodos = document.querySelector(".add-todo-form");

const addTodo = function() {

  const doInput = document.querySelector("[name=add-todo]").value;
  const todo = {"add-todo": doInput, "done": false};
  todos.push(todo);
  doInput = "";
};

const populateList = function() {
  ul.innerHTML = todos.map((todo, idx) => {
    return `<li>
    <label>${todo['add-todo']}</label>
    <input type='checkbox'></input>
    </li>`;

  });

  // groceries.innerHTML = lsItems.map((item) => {
  //   return `<li>${item.value}</li>`;
  // }).join(" ");
}


