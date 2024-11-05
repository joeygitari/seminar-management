namespace SeminarManagement.SeminarManagement;

page 50114 "Posted Seminar Reg. List"
{
    ApplicationArea = All;
    Caption = 'Posted Seminar Registration List';
    PageType = List;
    SourceTable = "Posted Seminar Reg. Header";
    UsageCategory = Lists;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ToolTip = 'Specifies the value of the Seminar No. field.', Comment = '%';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ToolTip = 'Specifies the value of the Seminar Name field.', Comment = '%';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Maximum Participants field.', Comment = '%';
                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ToolTip = 'Specifies the value of the Room No. field.', Comment = '%';
                }
            }
        }
    }
}
