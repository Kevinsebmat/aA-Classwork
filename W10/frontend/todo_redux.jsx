import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import Root from './components/root'
import App from './components/app'
import {receiveTodos,receiveTodo,removeTodo} from './actions/todo_actions'
import {receiveSteps,receiveStep,removeStep} from './actions/step_actions'


document.addEventListener('DOMContentLoaded', () => {
    
    const root = document.getElementById('root')
    const store = configureStore();
    window.store = store;
    ReactDOM.render(<Root store={store} />, root)

    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo= removeTodo;
    window.receiveSteps = receiveSteps;
    window.receiveStep = receiveStep;
    window.removeStep= removeStep;
})

