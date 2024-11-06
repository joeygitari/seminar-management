namespace SeminarManagement.SeminarManagement;

page 50116 "Posted Seminar Reg Line"
{
    ApplicationArea = All;
    Caption = 'Posted Seminar Registration Line';
    PageType = List;
    SourceTable = "Posted Seminar Reg. Line";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field(Registered; Rec.Registered)
                {
                    ToolTip = 'Specifies the value of the Registered field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.', Comment = '%';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ToolTip = 'Specifies the value of the Line Discount % field.', Comment = '%';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.', Comment = '%';
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ToolTip = 'Specifies the value of the Participant Contact No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ToolTip = 'Specifies the value of the Participant Name field.', Comment = '%';
                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ToolTip = 'Specifies the value of the To Invoice field.', Comment = '%';
                }
                field(Participated; Rec.Participated)
                {
                    ToolTip = 'Specifies the value of the Participated field.', Comment = '%';
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ToolTip = 'Specifies the value of the Confirmation Date field.', Comment = '%';
                }
            }
        }
    }
}
