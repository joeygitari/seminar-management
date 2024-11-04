namespace SeminarMgt.SeminarMgt;

page 50105 "Seminar List"
{
    ApplicationArea = All;
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = Seminar;
    Editable = false;
    CardPageId = "Seminar Card";
    UsageCategory = Lists;
    
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
            group(RelatedInformation)
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
                // action("Ledger Entries")
                // {
                //     Caption = 'Ledger Entries';
                //     Image = WarrantyLedger;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ShortcutKey = 'Ctrl+F7';
                //     RunObject = Page "Seminar Ledger Entries";
                //     RunPageLink = "Seminar No." = FIELD("No.");
                // }
                action("Seminar Setup")
                {
                    ApplicationArea = All;
                    Caption = '&Seminar';
                    
                    RunObject = Page "Seminar Setup";
                    RunPageLink = "Seminar Nos." = FIELD("No.");
                }

                // action(Registrations)
                // {
                //     Caption = '&Registrations';
                //     Image = Timesheet;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Seminar Registration";
                //     RunPageLink = "Seminar No." = FIELD("No.");
                // }
            }
            group(NewDocumentItems)
            {
                action("Seminar Registration")
                {
                    Caption = 'Seminar Registration';
                    RunPageMode = Create;
                    Image = NewTimesheet;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    RunObject = Page "Seminar Registration";
                    RunPageLink = "Seminar No." = FIELD("No.");
                }
            }
        }
    }
}
