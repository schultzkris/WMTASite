﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="DistrictPointEntry.aspx.cs" Inherits="WMTA.Events.DistrictPointEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="well bs-component col-md-6 main-div center">
            <section id="registrationForm">
                <asp:UpdatePanel ID="upFullPage" runat="server">
                    <ContentTemplate>
                        <div class="form-horizontal">
                            <%-- Start of form --%>
                            <fieldset>
                                <legend>District Point Entry</legend>
                                <%-- Student search --%>
                                <asp:UpdatePanel ID="upStudentSearch" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <h4>Student Search</h4>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="txtStudentId" CssClass="col-md-3 control-label float-left">Student Id</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="txtStudentId" CssClass="form-control" />
                                                </div>
                                                <asp:Button ID="btnStudentSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-min-width-72" OnClick="btnStudentSearch_Click" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-3 control-label">First Name</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                                                </div>
                                                <asp:Button ID="btnClearStudentSearch" runat="server" Text="Clear" CssClass="btn btn-default btn-min-width-72" OnClick="btnClearStudentSearch_Click" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-3 control-label">Last Name</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-3-margin popover-font">
                                                <a href="#" id="searchHint">Search Tip</a>
                                            </div>
                                            <div class="form-group">
                                                <asp:GridView ID="gvStudentSearch" runat="server" CssClass="td table table-hover table-striped smaller-font width-80 center" AllowPaging="true" AutoGenerateSelectButton="true" PagerStyle-CssClass="bs-pagination"
                                                    OnPageIndexChanging="gvStudentSearch_PageIndexChanging" OnRowDataBound="gvStudentSearch_RowDataBound" OnSelectedIndexChanged="gvStudentSearch_SelectedIndexChanged" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%-- End Student Search --%>
                                <%-- Point Data --%>
                                <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                                    <asp:UpdatePanel ID="upInfo" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <h4>Audition Points</h4>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="lblStudent" CssClass="col-md-3 control-label float-left">Student</asp:Label>
                                                    <div class="col-md-6 label-top-margin">
                                                        <asp:Label runat="server" ID="lblStudent" /><label runat="server" id="lblStudId" visible="false" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-3 control-label">Year</asp:Label>
                                                    <div class="col-md-6">
                                                        <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropdown-list form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" />
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlYear" CssClass="txt-danger vertical-center font-size-12" ErrorMessage="Year is required"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="cboAudition" CssClass="col-md-3 control-label">Audition</asp:Label>
                                                    <div class="col-md-6">
                                                        <asp:DropDownList ID="cboAudition" runat="server" CssClass="dropdown-list form-control" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="cboAudition_SelectedIndexChanged" />
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboAudition" CssClass="txt-danger vertical-center font-size-12" ErrorMessage="Audition is required"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="rblAttendance" CssClass="col-md-3 control-label">Attendance</asp:Label>
                                                    <div class="col-md-6">
                                                        <asp:RadioButtonList ID="rblAttendance" runat="server" CssClass="radio" RepeatLayout="Flow" OnSelectedIndexChanged="rblAttendance_SelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem Selected="True">Attended</asp:ListItem>
                                                            <asp:ListItem>No Show</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <asp:Table ID="tblCompositions" runat="server" CssClass="td table table-hover table-striped smaller-font width-80 center">
                                                    <asp:TableHeaderRow BorderStyle="Outset" BorderWidth="2px">
                                                        <asp:TableHeaderCell Scope="Column" Text="CompId" Visible="false" />
                                                        <asp:TableHeaderCell Scope="Column" Text="Composition" />
                                                        <asp:TableHeaderCell Scope="Column" Text="Points" />
                                                    </asp:TableHeaderRow>
                                                </asp:Table>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div id="divGrade" class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="txtTheoryPoints" CssClass="col-md-3 control-label">Theory Points</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" ID="txtTheoryPoints" CssClass="form-control small-txtbx-width" TextMode="Number" OnTextChanged="txtTheoryPoints_TextChanged" AutoPostBack="true" />
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTheoryPoints" CssClass="text-danger vertical-center font-size-12" ErrorMessage="Theory points are required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" AssociatedControlID="lblPoints" CssClass="col-md-3 control-label float-left">Point Total</asp:Label>
                                                <div class="col-md-6">
                                                    <asp:Label runat="server" ID="lblPoints" />
                                                    <asp:Button ID="btnUpdatePoints" runat="server" Text="Update Total" CssClass="btn btn-link" OnClick="btnUpdatePoints_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div class="form-group">
                                                <div class="col-lg-10 col-lg-offset-2 float-right">
                                                    <asp:Button ID="btnClear" Text="Clear" runat="server" CssClass="btn btn-default float-right" OnClick="btnClear_Click" CausesValidation="false" />
                                                    <asp:Button ID="btnSubmit" Text="Submit" runat="server" CssClass="btn btn-primary float-right margin-right-5px" OnClick="btnSubmit_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                                <%-- End Point Data --%>
                            </fieldset>
                        </div>
                        <label id="lblErrorMessage" runat="server" style="color: transparent">.</label>
                        <label id="lblWarningMessage" runat="server" style="color: transparent">.</label>
                        <label id="lblInfoMessage" runat="server" style="color: transparent">.</label>
                        <label id="lblSuccessMessage" runat="server" style="color: transparent">.</label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </section>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#searchHint').popover(
            {
                trigger: 'hover',
                html: true,
                placement: 'right',
                content: 'Fill in any number of the search fields and click "Search" to find students. Clicking "Search" without filling in any fields will return all students linked to you. First and last names do not need to be complete in order to search.  Ex: entering "sch" in the Last Name field would find all students with last names containing "sch"."',
            });
        });

        //show an error message
        function showMainError() {
            var message = $('#MainContent_lblErrorMessage').text();

            $.notify(message.toString(), { position: "left-top", className: "error" });
        };

        //show a warning message
        function showWarningMessage() {
            var message = $('#MainContent_lblWarningMessage').text();

            $.notify(message.toString(), { position: "left-top", className: "warning" });
        };

        //show an informational message
        function showInfoMessage() {
            var message = $('#MainContent_lblInfoMessage').text();

            $.notify(message.toString(), { position: "left-top", className: "info" });
        };

        //show a success message
        function showSuccessMessage() {
            var message = $('#MainContent_lblSuccessMessage').text();

            $.notify(message.toString(), { position: "left-top", className: "success" });
        };
    </script>
</asp:Content>
