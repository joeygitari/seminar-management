namespace SeminarManagement.SeminarManagement;
page 50115 "Seminar Registration List"
{
    ApplicationArea = All;
    Caption = 'Seminar Registration List';
    PageType = List;
    SourceTable = "Seminar Registration Header";
    CardPageId = 50109;
    UsageCategory = Lists;
    Editable = false;
  
    layout
    {
        area(content)
        {
            repeater(RepeaterControl)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the registered seminar will start.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the seminar registered on this document.';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the seminar registered on this document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the document is being planned, open for registration, has been closed, or canceled.';
                }
                field("Duration"; Rec.Duration)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the duration of the registered seminar.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum number of participants needed for to the registered seminar.';
                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the room that is assigned to the registered seminar.';
                }
            }
        }
        area(factboxes)
        {
            part(SeminarDetailsFactBox; 50107)
            {
                SubPageLink = "No." = field("Seminar No.");
            }
            systempart(Links; Links) { }
            systempart(Notes; Notes) { }
        }
    }

    actions
    {
        area(processing)
        {
            group(Posting)
            {
                action(Post)
                {
                    ApplicationArea = All;
                    Caption = 'P&ost';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = 'F9';
                    RunObject = Codeunit "Seminar-Post (Yes/No)";

                    trigger OnAction()
                    var
                        SeminarPosYesNo: Codeunit "Seminar-Post (Yes/No)";
                    begin
                        SeminarPosYesNo.Run(Rec);
                    end;
                }
            }
        }
    }
}
