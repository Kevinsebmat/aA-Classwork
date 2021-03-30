import React from 'react'
import {connect} from 'react-redux'
import TodoList from './todo_list_index'
import {receiveTodos, removeTodo, receiveTodo} from '../actions/todo_actions'
import {allTodos} from '../reducers/selectors'


const mapStateToProps = (state) => ({
    todos: allTodos(state)
})

const mapDispatchToProps = (dispatch) => ({
    receiveTodos: todos => dispatch(receiveTodos(todos)),
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: todo => dispatch(removeTodo(todo))
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList)