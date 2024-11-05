namespace SeminarManagement.SeminarManagement;

page 50113 "Posted Seminar Registration"
{
    ApplicationArea = All;
    Caption = 'Posted Seminar Registration';
    PageType = Card;
    SourceTable = "Posted Seminar Reg. Header";
    
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
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Resource No. field.', Comment = '%';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Name field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Maximum Participants field.', Comment = '%';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.', Comment = '%';
                }
            }
            group("Seminar Room")
            {
                Caption = 'Seminar Room';
                
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ToolTip = 'Specifies the value of the Room No. field.', Comment = '%';
                }
                field("Room Name"; Rec."Room Name")
                {
                    ToolTip = 'Specifies the value of the Room Name field.', Comment = '%';
                }
                field("Room Address"; Rec."Room Address")
                {
                    ToolTip = 'Specifies the value of the Room Address field.', Comment = '%';
                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ToolTip = 'Specifies the value of the Room Address 2 field.', Comment = '%';
                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ToolTip = 'Specifies the value of the Room Post Code field.', Comment = '%';
                }
                field("Room City"; Rec."Room City")
                {
                    ToolTip = 'Specifies the value of the Room City field.', Comment = '%';
                }
                field ("Room County"; Rec."Room County")
                {
                    ToolTip = 'Specifies the value of the Room County field.', Comment = '%';
                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ToolTip = 'Specifies the value of the Room Country/Reg. Code field.', Comment = '%';
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';

                field("Price"; Rec."Price")
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(Navigate)
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date",Rec."No.");
                    Navigate.Run;
                end;
            }
        }

    }
    var Navigate: Page 344;
}
