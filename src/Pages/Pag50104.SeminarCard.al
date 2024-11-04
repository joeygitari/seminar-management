namespace SeminarMgt.SeminarMgt;

page 50104 "Seminar Card"
{
    ApplicationArea = All;
    Caption = 'Seminar Card';
    PageType = Card;
    SourceTable = Seminar;
    Editable = true;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
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
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit then begin
                            CurrPage.UPDATE;
                        end;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.', Comment = '%';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Maximum Participants field.', Comment = '%';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies the value of the Search Name field.', Comment = '%';
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ToolTip = 'Specifies the value of the Seminar Duration field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.', Comment = '%';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.', Comment = '%';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ToolTip = 'Specifies the value of the Seminar Price field.', Comment = '%';
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
