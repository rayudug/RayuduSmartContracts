//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Todo{
      struct ToDo{
          string text;
          bool status;
      }
      ToDo[] public todo;
      function create(string calldata _text) public {
         todo.push(ToDo({text : _text,status : true}));
      }
      function updateTodo(string calldata _text,uint _index) public{
          todo[_index].text = _text;
      }
      function getData(uint _index) public  view returns(string memory,bool){
         ToDo memory todos = todo[_index];
         return(todos.text,todos.status);
      }
}