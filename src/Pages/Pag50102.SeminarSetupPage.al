namespace SeminarMgt.SeminarMgt;

page 50102 "Seminar Setup Page"
{
    ApplicationArea = All;
    Caption = 'Seminar Setup Page';
    PageType = List;
    SourceTable = "Seminar Setup";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the "Primary Key field.', Comment = '%';
                }
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
                    ToolTip = 'Specifies the value of the Posted Seminar Reg. Nos. field.', Comment = '%';
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
