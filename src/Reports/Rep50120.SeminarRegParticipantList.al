// namespace SeminarManagement.SeminarManagement;

report 50120 "Seminar Reg.-Participant List"
{
    ApplicationArea = All;
    Caption = 'Seminar Registration-Participant List';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SeminarRegParticipantList.rdl';

    dataset
    {
        dataitem(SeminarRegistrationHeader; "Seminar Registration Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Seminar No.";

            column(No_SeminarRegistrationHeader; "No.")
            {
                IncludeCaption = true;
            }
            column(SeminarNo_SeminarRegistrationHeader; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(SeminarName_SeminarRegistrationHeader; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(StartingDate_SeminarRegistrationHeader; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration_SeminarRegistrationHeader; "Duration")
            {
                IncludeCaption = true;
            }
            column(InstructorName_SeminarRegistrationHeader; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(RoomName_SeminarRegistrationHeader; "Room Name")
            {
                IncludeCaption = true;
            }

            dataitem(SeminarRegistrationLine; "Seminar Registration Line")
            {
                DataItemTableView = SORTING("Document No.", "Line No.");
                DataItemLink = "Document No." = Field("No.");

                column(BilltoCustomerNo_SeminarRegistrationLine; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo_SeminarRegistrationLine; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName_SeminarRegistrationLine; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
            trigger OnPreDataItem();
            begin
                CompanyInformation.Get();
            end;

            trigger OnAfterGetRecord();
            begin
                SeminarRegistrationHeader.CalcFields("Instructor Name");
            end;

            trigger OnPostDataItem();
            begin
                if not CurrReport.Preview() then
                    Codeunit.Run(Codeunit::"Sem. Registration Printed", SeminarRegistrationHeader);
            end;
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));

            column(CompanyInformation_Name; CompanyInformation.Name) { }
        }
    }

    labels
    {
        SeminarRegistrationHeader = 'Seminar Registration Header';
    }

    var
        CompanyInformation: Record 79;
        Print: Boolean;
}
