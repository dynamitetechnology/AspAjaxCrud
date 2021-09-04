<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AjaxCurdApp._Default" %>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
       <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
    <title>Hello, world!</title>
  </head>
  <body>
    
      <div class="container-fluid">
          <div class="row">
              <div class="col-md-3">
                
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="uname" >
      <input type="hidden" id="hiddenid" />
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">UserName</label>
    <input type="text" class="form-control" id="username">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">Email</label>
    <input type="text" class="form-control" id="uemail">
  </div>

  <button type="submit" class="btn  btn-success  rounded-0 addUser">Add User</button>
   <button type="submit" class="btn btn-primary d-none updateUser">Update User</button>

              </div>
              <div class="col-md-9">
                  <table class="table" id="userTable">
                  <asp:Repeater ID="userList" runat="server">
                      <HeaderTemplate>
                            <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">UserName</th>
        <th scope="col">Email</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
                      </HeaderTemplate>
                    
                      <ItemTemplate>
                           
    <tr>
      <th scope="row"><%#Eval("id") %></th>
      <td><%#Eval("name") %></td>
      <td><%#Eval("username") %></td>
      <td><%#Eval("email") %></td>
      <td>
          <button class="editUsers btn-sm btn btn-success rounded-0 " data-name="<%#Eval("name") %>" data-username="<%#Eval("username") %>" data-email="<%#Eval("email") %>" data-id="<%#Eval("id") %>">Edit</button>
          <button class="btn-sm btn btn-danger rounded-0">Delete</button></td>
    </tr>

  
                      </ItemTemplate>
                      
                  </asp:Repeater>
                 
</table>
              </div>
          </div>
      </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
      <script>
          $(document).ready(function () {

              $('#userTable').DataTable();
              $(".addUser").on('click', function () {
                  let uname = $("#uname").val();
                  let username = $("#username").val();
                  let uemail = $("#uemail").val();

                  $.ajax({
                      type: "POST",
                     contentType: "application/json; charset=utf-8",
                      url: "WebService1.asmx/insertUser",
                      data: "{'uname':'" + uname + "','username':'" + username + "','uemail':'" + uemail + "'}",
                      success: function (resp) {

                          console.log('Response =======>', resp)
                          swal("Good job!", "You clicked the button!", "success").then(function () {
                              location.reload()
                          });
                          //location.reload()
                      },
                      dataType: "json"
                  });

              })


              //Exit User
              $("#userTable").on('click','.editUsers', function () {

                  let name = $(this).attr("data-name")
                  let username = $(this).attr("data-username");
                  let email = $(this).attr("data-email");
                  console.log('name---------->', name, username, email)
                  $("#hiddenid").val($(this).attr("data-id"))
                  $("#uname").val(name)
                  $("#username").val(username);
                  $("#uemail").val(email);

                  $(".addUser").addClass('d-none')
                  $(".updateUser").removeClass('d-none')
              })
          })
      </script>
  </body>
</html>