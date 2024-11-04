table 50107 "Seminar Comment Line"
{
    Caption = 'Seminar Comment Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionMembers = "Seminar Registration","Posted Seminar Registration";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        field(7; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document Type", "No.", "Document Line No.", "Line No.")
        {
            Clustered = true;
        }
    }
    procedure SetupNewLine(var SeminarCommentLine: Record "Seminar Comment Line")
    begin
        SeminarCommentLine.SetRange("Document Type", "Document Type");
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        SeminarCommentLine.SetRange(Date, WorkDate);
        if not SeminarCommentLine.Find('-') then begin
            Date := WorkDate;
        end;
    end;
}
