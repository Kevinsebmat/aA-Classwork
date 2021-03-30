import React from 'react';
import {allTodos} from '../reducers/selectors'
import TodoListItem from './todo_list/todo_list_item'
import TodoForm from './todo_list/todo_form'

export const TodoList = (props) => {
    return (
        <div>
            <ul>
                {
                    props.todos.map(todo => TodoListItem(todo) ) 
                } 
                
            </ul>

            <div><TodoForm/></div>
        </div>
    )
}


export default TodoList;