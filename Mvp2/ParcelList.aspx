<%@ Page Title="Parcels" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParcelList.aspx.cs" Inherits="Mvp2.ParcelList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView runat="server" ID="ParcelGrid"
        ItemType="Mvp2.Models.Parcel" DataKeyNames="ParcelID"
        SelectMethod="GetParcels" ShowFooter="true"
        AutoGenerateColumns="false" OnRowDataBound="ParcelGrid_RowDataBound"
        CssClass="table table-condensed table-responsive table-striped table-hover">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <Columns>
            <asp:DynamicField DataField="Title" FooterText="Total Weight" />
            <asp:DynamicField DataField="Weight" FooterText="0" />
            <%--<asp:TemplateField HeaderText="Weight">
                <ItemTemplate>
                    <span><%#: Item.Weight %></span>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Remove">
                <ItemTemplate>
                    <span class="btn btn-danger btn-sm">REMOVE</span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle Font-Bold="true" Font-Size="Larger" />
    </asp:GridView>

</asp:Content>
