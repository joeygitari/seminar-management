table 50111 "Posted Seminar Reg. Header"
{
    Caption = 'Posted Seminar Reg. Header';
    DataClassification = ToBeClassified;
    LookupPageId = "Posted Seminar Registration";
    DrillDownPageId = "Posted Seminar Registration";
    
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
        field(15; "Registration No. Series"; Code[20])
        {
            Caption = 'Registration No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
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
        field(19; Status; Enum "Posted Seminar Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
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
        field(28; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Seminar Comment Line" where("Document Type" = const("Posted Seminar Registration"), "No." = field("No.")));
        }
        field(29; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            TestTableRelation = false;

            // trigger OnLookup()
            // var UserMgt: Codeunit "User Management";
            // begin
            //     UserMgt.LookupUserID("User ID"); //function does not exist
            // end;
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }     
    }
    // keys
    // {
    //     key(PK; "User ID")
    //     {
    //         Clustered = true;
    //     }
    // }
}
