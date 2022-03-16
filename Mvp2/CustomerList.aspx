<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="Mvp2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="jumbotron">
        <h1>EXERCISE 2</h1>
        <p class="lead">Design a web application that calculates the cost of delivery using the combined weight (kg) for a list of parcels for a customer. </p>
        <p class="lead">Please use this as an opportunity to demonstrate your skills in software design, web development and SQL skills.</p>
    </div>--%>

    <div class="row">
        <div class="panel panel-primary list-panel">
            <div class="panel-heading list-panel-heading">
                <h1 class="panel-title list-panel-title">ADD CUSTOMER</h1>
            </div>
            <div class="panel-body">
                <div class="form-inline">
                    <div class="input-group">
                        <input type="text" runat="server" id="inputName" name="CustomerName" placeholder="Customer Name" maxlength="100" required="required" />
                        <input type="text" runat="server" id="inputPhone" name="CustomerPhone" placeholder="Phone Number" maxlength="10" />
                        <div class="input-group-btn">
                            <asp:Button ID="BtnAddCustomer" runat="server" CssClass="btn btn-success btn-sm" OnClick="BtnAddCustomer_Click" Text="Add Customer" />
                        </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            ControlToValidate="inputPhone" runat="server"
                            ErrorMessage="Phone number is incorrect"
                            ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary list-panel">
            <div class="panel-heading list-panel-heading">
                <h1 class="panel-title list-panel-title text-center">EXISTING CUSTOMERS</h1>
            </div>
            <div class="panel-body">
                <asp:GridView runat="server" ID="CustomersGrid"
                    ItemType="Mvp2.Models.Customer" DataKeyNames="CustomerID"
                    SelectMethod="GetCustomers" UpdateMethod="CustomersGrid_UpdateItem" DeleteMethod="CustomersGrid_DeleteItem"
                    AutoGenerateColumns="false" CellPadding="60"
                    CssClass="table table-bordered table-responsive table-hover table-condensed">
                    <Columns>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button runat="server" CssClass="btn btn-warning btn-sm" Text='Update' CommandName="Edit" UseSubmitBehavior="false" />
                                <asp:Button runat="server" CssClass="btn btn-danger btn-sm" Text='Delete' CommandName="Delete" UseSubmitBehavior="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button runat="server" CssClass="btn btn-success btn-sm" Text='Save' CommandName="Update" UseSubmitBehavior="false" />
                                <asp:Button runat="server" CssClass="btn btn-danger btn-sm" Text='Cancel' CommandName="Cancel" UseSubmitBehavior="false" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:DynamicField DataField="Name" />
                        <asp:DynamicField DataField="Phone" />
                        <asp:TemplateField HeaderText="Parcel">
                            <ItemTemplate>
                                <a class="btn btn-sm btn-info" href="/ParcelList.aspx?customerId=<%#: Item.CustomerID %>" UseSubmitBehavior="false" >View Parcel</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row alert alert-warning alert-dismissable fade in" style="margin-bottom: 0px">
                            There are no items in your shopping cart
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>


    </div>
    </div>

    <%--<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-header">Parcel of Customer</div>
            <div class="modal-content">
                Hello
            </div>
        </div>
    </div>--%>
</asp:Content>
