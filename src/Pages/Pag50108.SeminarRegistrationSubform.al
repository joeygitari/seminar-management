namespace SeminarMgt.SeminarMgt;

page 50108 "Seminar Registration Subform"
{
    // ApplicationArea = All;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Seminar Registration Line";
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    Editable = true;
    
    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer company that registers the participant and will be billed to.';
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the participant.';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the participant.';
                }
                field(Participated; Rec.Participated)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the participant has participated in the seminar.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the participant was registered for the seminar.';
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the participant''s registration was confirmed.';
                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the customer will be billed.';
                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the participant was registered.';
                }
                field("Seminar Price"; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount, excluding discount amount, that must be paid for.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the discount percentage that is granted.';
                    BlankZero = true;
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the discount amount that is granted.';
                    BlankZero = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount, including discount amount, that must be paid for.';
                    BlankZero = true;
                }
            }
        }
    }
}
