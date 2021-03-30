import React from 'react'



export const TodoListItem = (item) => {
    return ( <li key={item.id}>{item.title}</li>

    )
}

export default TodoListItem