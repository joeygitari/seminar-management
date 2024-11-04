table 50103 Seminar
{
    Caption = 'Seminar';
    DataClassification = ToBeClassified;
    LookupPageId = 50103;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
           
            trigger OnValidate()
            var
                SeminarSetup: Record "Seminar Setup";
                NoSeriesMgt: Codeunit "NoSeriesManagement";
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) OR ("Search Name" = '') then begin
                    "Search Name" := Name;
                end
            end;
        }
        field(3; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(4; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(5; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(6; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(7; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(9; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Exist("Comment Line" WHERE("Table Name" = CONST(Seminar), "No." = FIELD("No.")));
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(11; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            var
                GenProdPostingGroup: Record "Gen. Product Posting Group";
            begin
                IF xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN BEGIN 
                    IF GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, GenProdPostingGroup."Def. VAT Prod. Posting Group") THEN BEGIN 
                        VALIDATE("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group"); 
                    END;        
                END;
            end;

        }
        field(12; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SecondaryKey; "Search Name")
        {
            Clustered = false;
        }
    }

    trigger OnInsert()
    var
        SeminarSetup: Record "Seminar Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    begin
        if "No." = '' THEN begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.","No. Series");
        end;
    end;    

    trigger OnModify()
    begin
        "Last Date Modified" := TODAY;
    end;

    // Trigger when a seminar record is renamed
    trigger OnRename()
    begin
        "Last Date Modified" := TODAY;
    end;

    // Trigger when a seminar record is deleted
    trigger OnDelete()
    var
        CommentLine: Record "Comment Line";
    begin
        CommentLine.RESET;
        CommentLine.SETRANGE("Table Name", CommentLine."Table Name"::Seminar);
        CommentLine.SETRANGE("No.", "No."); 
        CommentLine.DELETEALL;
    end;

    var 
        SeminarSetup: Record "Seminar Setup";
        Seminar: Record "Seminar";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    procedure AssistEdit(): Boolean
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",xRec."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;

        end;
    end;
}
