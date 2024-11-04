table 50112 "Posted Seminar Reg. Line"
{
    Caption = 'Posted Seminar Reg. Line';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "Posted Seminar Reg. Header";
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
        }
        field(4; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(5; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
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
        }
        field(8; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(9; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            DataClassification = CustomerContent;
            TableRelation = Contact;
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
}
