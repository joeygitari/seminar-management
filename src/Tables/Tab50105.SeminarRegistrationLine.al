table 50105 "Seminar Registration Line"
{
    Caption = 'Seminar Registration Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(2; Registered; Boolean)
        {
            Caption = 'Registered';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Price"; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
            AutoFormatType = 2;

            trigger OnValidate()
            begin
                Validate("Line Discount %");
            end;
        }
        field(4; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;

            trigger OnValidate()
            var
                GLSetup: Record "General Ledger Setup";
            begin
                if "Price" = 0 then begin
                    "Line Discount %" := 0;
                end else begin
                    GLSetup.Get;
                    "Line Discount %" := Round("Line Discount Amount" / "Price" * 100, GLSetup."Amount Rounding Precision");
                end;
                UpdateAmount(GLSetup);
            end;
        }
        field(5; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            var
                GLSetup: Record "General Ledger Setup";
            begin
                if "Price" = 0 then begin
                    "Line Discount Amount" := 0;
                end else begin
                    GLSetup.Get;
                    "Line Discount Amount" := Round("Line Discount %" * "Price" * 0.01, GLSetup."Amount Rounding Precision")
                end;
                UpdateAmount(GLSetup);
            end;
        }
        field(6; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;

            trigger OnValidate()
            var
                GLSetup: Record "General Ledger Setup";
            begin
                TestField("Bill-to Customer No.");
                TestField("Price");
                GLSetup.Get;
                Amount := Round(Amount, GLSetup."Amount Rounding Precision");
                "Line Discount Amount" := "Price" - Amount;
                if "Price" = 0 then begin
                    "Line Discount %" := 0;
                end else begin
                    "Line Discount %" := Round("Line Discount Amount" / "Price" * 100, GLSetup."Amount Rounding Precision");
                end;
            end;
        }
        field(8; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if "Bill-to Customer No." <> xRec."Bill-to Customer No." then begin
                    if Registered then begin
                        error('', FieldCaption("Bill-to Customer No."), FieldCaption(Registered), Registered);
                    end
                end;
            end;
        }
        field(9; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            DataClassification = CustomerContent;
            TableRelation = Contact;

            trigger OnValidate()
            var
                Contact: Record Contact;
                ContactBusinessRelation: Record "Contact Business Relation";
            begin
                if ("Bill-to Customer No." <> '') and
                    ("Participant Contact No." <> '') then begin
                    Contact.Get("Participant Contact No.");
                    ContactBusinessRelation.Reset;
                    ContactBusinessRelation.SetCurrentKey("Link to Table", "No.");
                    ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                    ContactBusinessRelation.SetRange("No.", "Bill-to Customer No.");
                    if ContactBusinessRelation.FindFirst then begin
                        if ContactBusinessRelation."Contact No." <> Contact."Company No." then begin
                            Error('', Contact."No.", Contact.Name, "Bill-to Customer No.");
                        end;
                    end;
                end;
                ContactBusinessRelation.Reset;
                ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                ContactBusinessRelation.SetRange("No.", "Bill-to Customer No.");
                if ContactBusinessRelation.FindFirst then begin
                    Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.");
                    if page.RunModal(Page::"Contact List", Contact) = Action::LookupOK then begin
                        "Participant Contact No." := Contact."No.";
                    end;
                end;
                CalcFields("Participant Name");
            end;
        }
        field(10; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(11; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Contact.Name where("No." = field("Participant Contact No.")));
        }
        field(12; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(13; Participated; Boolean)
        {
            Caption = 'Participated';
            DataClassification = CustomerContent;
        }
        field(14; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SeminarRegHeader: Record "Seminar Registration Header";
    begin
        SeminarRegHeader.Get();
        "Registration Date" := WorkDate;
        "Price" := SeminarRegHeader."Price";
        Amount := SeminarRegHeader."Price";
    end;

    trigger OnDelete()
    begin
        TestField(Registered, false);
    end;

    procedure GetSeminarRegHeader(var SeminarRegHeader: Record "Seminar Registration Header")
    begin
        if SeminarRegHeader."No." <> "Document No." then begin
            SeminarRegHeader.Get("Document No.");
        end;
    end;

    procedure UpdateAmount(var GLSetup: Record "General Ledger Setup");
    begin
        GLSetup.Get();
        Amount := Round("Price" - "Line Discount Amount", GLSetup."Amount Rounding Precision");
    end;
}
