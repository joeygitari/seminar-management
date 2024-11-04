namespace SeminarMgt.SeminarMgt;

page 50105 "Seminar List"
{
    ApplicationArea = All;
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = Seminar;
    Editable = false;
    CardPageId = "Seminar Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    // trigger OnAssistEdit()
                    // var
                    //     SeminarMgt: Codeunit "Seminar Management";
                    //     IsHandled: Boolean;
                    // begin
                    //     // Call the AssistEdit function of the Seminar Management codeunit
                    //     IsHandled := SeminarMgt.AssistEdit(Rec);

                    //     // If the assist edit is successful, update the page
                    //     IF IsHandled THEN
                    //         CurrPage.UPDATE;
                    // end;
                    
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ToolTip = 'Specifies the value of the Seminar Duration field.', Comment = '%';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ToolTip = 'Specifies the value of the Seminar Price field.', Comment = '%';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.', Comment = '%';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.', Comment = '%';
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
        area(Navigation)
        {
            action(Comments)
            {
                ApplicationArea = All;
                Caption = 'Co&mments';
                Image = Comment;
                
                // Define the action to run the Comment Sheet page
                RunObject = Page "Comment Sheet";
                RunPageLink = "No." = FIELD("No."), "Table Name" = CONST(Seminar);
            }
            action("Seminar Setup")
            {
                ApplicationArea = All;
                Caption = '&Seminar';
                
                RunObject = Page "Seminar Setup";
                RunPageLink = "Seminar Nos." = FIELD("No.");
            }
        }
    }
}
