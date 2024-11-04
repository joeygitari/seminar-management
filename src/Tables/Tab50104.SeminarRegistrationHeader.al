table 50104 "Seminar Registration Header"
{
    Caption = 'Seminar Registration Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger onValidate()
            var
                SeminarSetup: Record "Seminar Setup";
                NoSeriesMgt: Codeunit "NoSeriesManagement";
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Registration Nos.");
                    "No. Series" := '';
                END
            end;
        }
        field(2; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            DataClassification = CustomerContent;
            TableRelation = Resource where(Type = const(Person));
        }
        field(3; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            DataClassification = CustomerContent;
            TableRelation = Resource where(Type = const(Person));
            trigger OnValidate()
            var
                SeminarRoom: Record Resource;
            begin
                if "Room Resource No." = '' then begin
                    "Room Name" := '';
                    "Room Address" := '';
                    "Room Address 2" := '';
                    "Room Post Code" := '';
                    "Room City" := '';
                    "Room County" := '';
                    "Room Country/Reg. Code" := '';
                end
                else begin
                    SeminarRoom.Get("Room Resource No.");
                    "Room Name" := SeminarRoom.Name;
                    "Room Address" := SeminarRoom.Address;
                    "Room Address 2" := SeminarRoom."Address 2";
                    "Room Post Code" := SeminarRoom."Post Code";
                    "Room City" := SeminarRoom.City;
                    "Room County" := SeminarRoom.County;
                    "Room Country/Reg. Code" := SeminarRoom."Country/Region Code";
                end;
            end;
        }
        field(4; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Resource No."), Type = const(Person)));
        }
        field(5; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Starting Date" <> xRec."Starting Date" then begin
                    TestField(Status, Status::Planning);
                end;
            end;
        }
        field(6; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SeminarRegLine: Record "Seminar Registration Line";
            begin
                SeminarRegLine.Reset;
                SeminarRegLine.SetRange("Document No.", "No.");
                SeminarRegLine.SetRange(Registered, TRUE);
                if not SeminarRegLine.IsEmpty then begin
                    ERROR('',
                    FieldCaption("Seminar No."),
                    SeminarRegLine.TableCaption,
                    SeminarRegLine.FieldCaption(Registered),
                    true);
                end;
            end;
        }
        field(7; "Room Name"; Text[100])
        {
            Caption = 'Room Name';
            DataClassification = CustomerContent;
        }
        field(8; "Room Address"; Text[100])
        {
            Caption = 'Room Address';
            DataClassification = CustomerContent;
        }
        field(9; "Room Address 2"; Text[50])
        {
            Caption = 'Room Address 2';
            DataClassification = CustomerContent;
        }
        field(10; "Room Post Code"; Code[20])
        {
            Caption = 'Room Post Code';
            DataClassification = CustomerContent;
            TableRelation = "Post Code";
            ValidateTableRelation = false;

            trigger onValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidatePostCode("Room City", "Room Post Code", "Room County", "Room Country/Reg. Code", (CurrFieldNo <> 0) AND GuiAllowed);
            end;
        }
        field(11; "Room City"; Text[30])
        {
            Caption = 'Room City';
            DataClassification = CustomerContent;
        }
        field(12; "Room County"; Text[30])
        {
            Caption = 'Room County';
            DataClassification = CustomerContent;
        }
        field(13; "Room Country/Reg. Code"; Code[10])
        {
            Caption = 'Room Country/Reg. Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(14; "Price"; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
            AutoFormatType = 1;

            trigger OnValidate()
            var
                SeminarRegLine: Record "Seminar Registration Line";
            begin
                if ("Price" <> xRec."Price") AND (Status <> Status::Canceled) then begin
                    SeminarRegLine.RESET;
                    SeminarRegLine.SETRANGE("Document No.", "No.");
                    SeminarRegLine.SETRANGE(Registered, FALSE);
                    if SeminarRegLine.FindSet(false, false) then begin
                        if Confirm('', false, FieldCaption("Price"), SeminarRegLine.TableCaption) then begin
                            repeat
                                SeminarRegLine.Validate("Price", "Price");
                                SeminarRegLine.Modify;
                            until SeminarRegLine.Next() = 0;
                            modify;
                        end;
                    end;
                end;
            end;
        }
        field(15; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

            trigger OnValidate()
            var
                SeminarSetup: Record "Seminar Setup";
                NoSeriesMgt: Codeunit "NoSeriesManagement";
            begin
                if "Posting No. Series" <> '' then begin
                    SeminarSetup.Get();
                    SeminarSetup.TestField("Seminar Registration Nos.");
                    SeminarSetup.TestField("Posted Seminar Reg. Nos.");
                    NoSeriesMgt.TestSeries(SeminarSetup."Posted Seminar Reg. Nos.", "Posting No. Series");
                end;
                TestField("Posting No.", '');
            end;

            trigger OnLookup()
            var
                SeminarRegHeader: Record "Seminar Registration Header";
                SeminarSetup: Record "Seminar Setup";
                NoSeriesMgt: Codeunit "NoSeriesManagement";
            begin
                with SeminarRegHeader do begin
                    SeminarRegHeader := Rec;
                    SeminarSetup.Get();
                    SeminarSetup.TestField("Seminar Registration Nos.");
                    SeminarSetup.TestField("Posted Seminar Reg. Nos.");
                    if NoSeriesMgt.LookupSeries(SeminarSetup."Posted Seminar Reg. Nos.", "Posting No. Series") then begin
                        Validate("Posting No. Series");
                    end;
                    Rec := SeminarRegHeader;
                end;
            end;
        }
        field(16; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(17; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(18; "Seminar Name"; Text[100])
        {
            Caption = 'Seminar Name';
            DataClassification = CustomerContent;
        }
        field(19; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = Open,Planning,Canceled,Closed;
        }
        field(20; "Duration"; Decimal)
        {
            Caption = 'Duration';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 1;
        }
        field(21; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = CustomerContent;
        }
        field(22; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = CustomerContent;
        }
        field(23; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
            AccessByPermission = tabledata "Gen. Product Posting Group" = R;
        }
        field(24; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "VAT Product Posting Group";
            AccessByPermission = tabledata "VAT Product Posting Group" = R;
        }
        field(25; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
        }
        field(26; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(27; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            DataClassification = CustomerContent;
        }
        field(28; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Seminar Comment Line" where("Document Type" = const("Seminar Registration"), "No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SeminarSetup: Record "Seminar Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    begin
        if GetFilter("Seminar No.") <> '' then 
        begin
            if GetRangeMin("Seminar No.") = GetRangeMax("Seminar No.") then
            begin
                Validate("Seminar No.", GetRangeMin("Seminar No."));
            end;
        end;
        IF "No." = '' THEN BEGIN
            SeminarSetup.GET;
            SeminarSetup.TESTFIELD("Seminar Registration Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Registration Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;

        IF "Posting Date" = 0D THEN
            "Posting Date" := WORKDATE;
        "Document Date" := WORKDATE;

        SeminarSetup.GET;
        NoSeriesMgt.SetDefaultSeries("Posting No. Series", SeminarSetup."Posted Seminar Reg. Nos.");
    end;

    trigger OnDelete()
    var
        SeminarRegLine: Record "Seminar Registration Line";
        SeminarCharge: Record "Seminar Charge";
        SeminarCommentLine: Record "Seminar Comment Line";
    begin
        TESTFIELD(Status, Status::Canceled);

        // Check for existing registered lines
        SeminarRegLine.RESET;
        SeminarRegLine.SETRANGE("Document No.", "No.");
        SeminarRegLine.SETRANGE(Registered, TRUE);

        // If any lines are in status Registered, throw an error
        IF SeminarRegLine.FIND('-') THEN
            ERROR('There are registered lines for %1 with %2 set to %3.',
                SeminarRegLine.TABLECAPTION,
                SeminarRegLine.FIELDCAPTION(Registered),
                TRUE);

        // Delete all lines for the seminar registration header
        SeminarRegLine.SETRANGE(Registered);
        SeminarRegLine.DELETEALL(TRUE);

        // Delete all seminar charges associated with the current registration header
        SeminarCharge.RESET;
        SeminarCharge.SETRANGE("Document No.", "No.");

        IF SeminarCharge.ISEMPTY THEN
            ERROR('There are seminar charges associated with this registration header: %1.', SeminarCharge.TABLECAPTION);

        // Delete all seminar comment lines associated with the current registration header
        SeminarCommentLine.RESET;
        SeminarCommentLine.SETRANGE("Document Type", SeminarCommentLine."Document Type"::"Seminar Registration");
        SeminarCommentLine.SETRANGE("No.", "No.");
        SeminarCommentLine.DELETEALL;
    end;

    procedure CompareMaxParticipants(var SeminarRoom: Record Resource)
    begin
        if (CurrFieldNo <> 0) then begin
            if (SeminarRoom."Maximum Participants" <> 0) and
                (SeminarRoom."Maximum Participants" < "Maximum Participants") then begin
                    if confirm ('', true, "Maximum Participants", FieldCaption("Maximum Participants"), "Maximum Participants", SeminarRoom."Maximum Participants") then begin
                        "Maximum Participants" := SeminarRoom."Maximum Participants";
                    end
                end;
        end;
    end;

    // procedure AssistEdit(var SeminarRegHeader : Record "Seminar Registration Header"; SeminarSetup : Record "Seminar Setup"; NoSeriesMgt : Codeunit "NoSeriesManagement")
    // begin
    //     with SeminarRegHeader do begin
    //         SeminarRegHeader := Rec;
    //         SeminarSetup.Get();
    //         SeminarSetup.TestField("Seminar Registration Nos.");

    //         if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Registration Nos.", OldSeminarRegHeader."No. Series", "No. Series") then begin
    //             SeminarSetup.Get();
    //             SeminarSetup.TestField("Seminar Registration Nos.");
    //             NoSeriesMgt.SetSeries("No.");
    //             Rec := SeminarRegHeader;

    //         end;
    //     end;
    // end;
}
