namespace SeminarManagement.SeminarManagement;

page 50111 "Seminar Registers"
{
    ApplicationArea = All;
    Caption = 'Seminar Registers';
    PageType = List;
    SourceTable = "Seminar Register";
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
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.', Comment = '%';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the value of the Journal Batch Name field.', Comment = '%';
                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ToolTip = 'Specifies the value of the From Entry No. field.', Comment = '%';
                }
                field("To Entry No."; Rec."To Entry No.")
                {
                    ToolTip = 'Specifies the value of the To Entry No. field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = "Record Links";
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = "Notes";
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Register)
            {
                Caption = 'Register';

                action("Seminar Ledger")
                {
                    Caption = 'Seminar Ledger';
                    Image = WarrantyLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "Seminar Reg.-Show Ledger";
                }
            }
        }
    }
}
