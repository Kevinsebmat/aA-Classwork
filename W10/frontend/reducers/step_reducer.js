import {RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from '../actions/step_actions'

const stepsReducer = (state = {}, action) => {
  
    Object.freeze(state)
    const nextState = Object.assign({}, state)
    switch (action.type) {
        case 'RECEIVE_STEP':
            nextState[action.step.id] = action.step
            return nextState
        case 'RECEIVE_STEPS':
            const newobj= {}
              action.steps.forEach((step) => {
                  newobj[step.id] = step
              })
            return newobj 
        case 'REMOVE_STEP':
            // debugger
            delete nextState[action.step.id]
            return nextState;
        default: 
            return state;
    }
};

export default stepsReducer;