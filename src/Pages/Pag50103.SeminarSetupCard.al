namespace SeminarMgt.SeminarMgt;

page 50103 "Seminar Setup"
{
    ApplicationArea = All;
    Caption = 'Seminar Setup';
    PageType = Card;
    SourceTable = "Seminar Setup";
    
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Seminar Nos."; Rec."Seminar Nos.")
                {
                    ToolTip = 'Specifies the value of the Seminar Nos. field.', Comment = '%';
                }
                field("Seminar Registration Nos."; Rec."Seminar Registration Nos.")
                {
                    ToolTip = 'Specifies the value of the Seminar Registration Nos. field.', Comment = '%';
                }
                field("Posted Seminar Reg. Nos."; Rec."Posted Seminar Reg. Nos.")
                {
                    ToolTip = 'Specifies the value of the Posted Seminar Registration Nos. field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        SeminarSetup: Record "Seminar Setup";
    begin
        IF NOT SeminarSetup.FINDFIRST THEN
            SeminarSetup.INSERT;
    end;
}
