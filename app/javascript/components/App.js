import React from 'react'
import { Route, Routes } from 'react-router-dom'
import ReactHome from './ReactHome'
const App = () =>{
  return ( 
    <Routes>
      <Route exact path="*" element={<ReactHome/>}/>
    </Routes>)
}
export default App