import {combineReducers} from 'redux'
import todosReducer from './todos_reducer'
import stepsReducer from './step_reducer'


const rootReducer = combineReducers({
    todos: todosReducer,
    steps: stepsReducer
})

export default rootReducer;