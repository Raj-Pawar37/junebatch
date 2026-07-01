<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeData.aspx.cs" Inherits="JunBatch2026WebFormApp.EmployeeData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//cdn.datatables.net/2.3.8/css/dataTables.dataTables.min.css"/>
    <script src="//cdn.datatables.net/2.3.8/js/dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%=GridView1.ClientID  %>').DataTable();
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Add Emp</button>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <asp:TextBox ID="TextBox3" runat="server" Enabled="false"></asp:TextBox><br />

        Name<asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
        
        Salary<asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>
        
        Profile <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />

        Manager<asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
        </asp:DropDownList>
       
        <asp:Button class="btn btn-primary" ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Update" />
          <br />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save  changes</button>
      </div>
    </div>
  </div>
</div>




            
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="EmpID">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("eid") %>'></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Profile">
                         <ItemTemplate>
                             <asp:Image ID="Image1" Height="100" Width="100" ImageUrl='<%#Eval("eprofile") %>' runat="server" /> 
                         </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Emp Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("ename") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Emp Salary">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("esalary") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Manager">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("mname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button class="btn btn-success" CommandName="Edit" CommandArgument='<%# Eval("eid") %>' ID="Button2" runat="server" Text="Edit"/>
                            <asp:Button class="btn btn-danger" CommandName="Delete" CommandArgument='<%# Eval("eid") %>' ID="Button3" runat="server" Text="Delete" OnClientClick="return confirm('Are you want to delete this record?')"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
            </asp:GridView>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="eid" DataSourceID="SqlDataSource1" PageSize="3">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="eid" HeaderText="eid" InsertVisible="False" ReadOnly="True" SortExpression="eid" />
                    <asp:BoundField DataField="ename" HeaderText="ename" SortExpression="ename" />
                    <asp:BoundField DataField="esalary" HeaderText="esalary" SortExpression="esalary" />
                    <asp:BoundField DataField="mid" HeaderText="mid" SortExpression="mid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [employee] WHERE [eid] = @original_eid AND (([ename] = @original_ename) OR ([ename] IS NULL AND @original_ename IS NULL)) AND (([esalary] = @original_esalary) OR ([esalary] IS NULL AND @original_esalary IS NULL)) AND (([mid] = @original_mid) OR ([mid] IS NULL AND @original_mid IS NULL))" InsertCommand="INSERT INTO [employee] ([ename], [esalary], [mid]) VALUES (@ename, @esalary, @mid)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [employee]" UpdateCommand="UPDATE [employee] SET [ename] = @ename, [esalary] = @esalary, [mid] = @mid WHERE [eid] = @original_eid AND (([ename] = @original_ename) OR ([ename] IS NULL AND @original_ename IS NULL)) AND (([esalary] = @original_esalary) OR ([esalary] IS NULL AND @original_esalary IS NULL)) AND (([mid] = @original_mid) OR ([mid] IS NULL AND @original_mid IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_eid" Type="Int32" />
                    <asp:Parameter Name="original_ename" Type="String" />
                    <asp:Parameter Name="original_esalary" Type="Decimal" />
                    <asp:Parameter Name="original_mid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ename" Type="String" />
                    <asp:Parameter Name="esalary" Type="Decimal" />
                    <asp:Parameter Name="mid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ename" Type="String" />
                    <asp:Parameter Name="esalary" Type="Decimal" />
                    <asp:Parameter Name="mid" Type="Int32" />
                    <asp:Parameter Name="original_eid" Type="Int32" />
                    <asp:Parameter Name="original_ename" Type="String" />
                    <asp:Parameter Name="original_esalary" Type="Decimal" />
                    <asp:Parameter Name="original_mid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            
            <br />
            <br />
            <br />
            
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>




        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">
  Launch demo modal</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        <asp:ListItem>Mumbai</asp:ListItem>
                        <asp:ListItem>Pune</asp:ListItem>
                        <asp:ListItem>Chennai</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
              </ContentTemplate>
          </asp:UpdatePanel>
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



    </form>
    
    
</body>
</html>
